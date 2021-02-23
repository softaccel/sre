
(function ($) {


$.fn.dataEl = function(options) {
	if(!options)
		options = {};

	let data = {};

	if(options.hasOwnProperty("data"))
		data = options.data;


	let props = {};
	if(options.hasOwnProperty("props"))
		props = options.props;


	/**
	 * dispatch event to an array of listeners
	 * @param evType
	 * @param ev
	 */
	function dispatch(evType,ev) {
		allowLogs = false;
		if(allowLogs && allowLogs.constructor===Array && allowLogs.indexOf("dispatch")>=0)
			console.log("dispatch "+evType,ev);

		if(!obj.events.hasOwnProperty(evType))
			return;

		ev.type = evType;

		obj.events[evType].forEach(function (item) {
			item(ev);
		});
	}

	function addListerner(event,callback,context) {

	}

	function createObject($el,options) {
		let obj = {
			$el: $el,
			container: null,
			events: {},
			children: [],
			attributes: {},
			getAttribute: function(name) {
				if (!this.attributes.hasOwnProperty(name))
					return undefined;
				return this.attributes[name];
			},
			getValue: function (name) {
				if (!this.attributes.hasOwnProperty(name))
					return undefined;
				return this.attributes[name].value;
			},
			remove: function (src) {
				let ev = {
					object: this,
					type: "remove",
					source: src
				};
				dispatch("remove", ev);
				this.el.remove();
				return this;
			},
			bulkSetValues: function (data, fireEvent = true) {
				if (!data)
					return;

				Object.getOwnPropertyNames(data).forEach(function (propName) {
					this.setValue(propName, data[propName], fireEvent);
				}, this);
				return this;
			},
			getEl: function (name) {
				if (!name)
					return null;
				if (!this.attributes.hasOwnProperty(name))
					return null;
				return this.attributes[name].$el;
			},
			getAllValues: function () {
				let values = {};
				Object.getOwnPropertyNames(this.attributes).forEach(function (attrName) {
					values[attrName] = this.attributes[attrName].value;
				}, this);
				return values;
			},
			setValue: function (propName, val, triggerEvent, domEvent,force) {

				if (!propName)
					return this;

				if (!this.attributes.hasOwnProperty(propName))
					this.attributes[propName] = {$el: null,value:null};

				let propertyObj = this.attributes[propName];

				if (propertyObj.value === val && !force)
					return this;

				if (typeof propertyObj.value === "object" && propertyObj.value !== null) {
					propertyObj.value.set(val);
					return this;
				}

				if(typeof triggerEvent==="undefined")
					triggerEvent = true;

				let oldVal = propertyObj.value;
				propertyObj.value = val;
				updateElementValue(propertyObj);

				if (triggerEvent) {
					let ev = {
						object: this,
						type: "update",
						attribute: propName,
						property: propName,
						oldValue: oldVal,
						newValue: val,
						targetEl: propertyObj.el,
						domEvent: domEvent
					};

					dispatch("update", ev);
				}
				return this;
			},
			setProp: function (name, propName, value) {
				if (!name)
					return this;

				if (!this.attributes.hasOwnProperty(name))
					return this;

				this.attributes[name].$el.prop(propName, value);
				return this;
			},
			getProp: function (name, propName) {
				if (!name)
					return null;

				if (!this.attributes.hasOwnProperty(name))
					return null;

				return this.attributes[name].$el.prop(propName);
			},
			on: function (evName, callback, ctx) {
				if (!this.events.hasOwnProperty(evName))
					this.events[evName] = [];

				if(ctx)
					callback = callback.bind(ctx);

				this.events[evName].push(callback);
				return this;
			},
			off: function (evName) {
				if (this.events.hasOwnProperty(evName))
					this.events[evName] = [];
				return this;
			},
			getAllData: function () {
				let attrs = {};
				let self = this;
				Object.getOwnPropertyNames(this.attributes).forEach(function (name) {
					attrs[name] = self.getValue(name);
				});
				return attrs;
			},
			reset: function () {
				Object.getOwnPropertyNames(this.attributes).forEach(function (name) {
					this.setValue(name, this.attributes[name].defaultValue);
				}, this);
			}
		};

		Object.assign(obj,options);

		if(obj.el && !obj.$el)
			obj.$el = $(obj.el);

		if(obj.$el && !obj.el)
			obj.el = obj.$el;

		// retrieve dynamic tags
		obj.$el.find("[data-sync]").each(function () {
			let name = $(this).data("sync");
			if(!name) return;

			let attr = {
				el: this,
				$el: $(this),
			};

			// read existing data
			if(["INPUT","SELECT","TEXTAREA"].indexOf($(this).prop("tagName"))!==-1) {
				attr.value = $(this).val();
				attr.defaultValue = $(this).val();
				$(attr.el)
					.on("change",function(event){
						obj.setValue(name,attr.$el.val(),true,event);
					})
					.on("click",function (event) {
						let ev = {
							object: obj,
							attribute: name,
							type: "click",
							domEvent: event
						};
						dispatch("click",ev);
					})
			}
			else {
				attr.value = $(this).text();
			}

			obj.attributes[name]  = attr;
		});

		// set dataEl for all subelements
		$el.find("*").data("dataEl",obj);

		return obj;
	}


	/**
	 * update HTML element of attribute
	 * @param attribute
	 */
	function updateElementValue(attribute) {
		if(["INPUT","SELECT","TEXTAREA"].indexOf($(attribute.el).prop("tagName"))!==-1) {
			$(attribute.el).val(attribute.value);
		}
		else {
			$(attribute.el).text(attribute.value);
		}
	}


	if(this.data("dataEl")===undefined)
		this.data("dataEl",createObject(this,options));

	let obj = this.data("dataEl");

	obj.bulkSetValues(data,false);

	return this;
};

})($);
