<?php
return [
    "usergroups"=> [
        "fields"=> [
            "groupid"=> [
                "iskey"=> true
            ]
        ],
        "keyFld"=> "groupid"
    ],
    "users"=> [
        "fields"=> [
            "userid"=> [
                "referencedBy"=> [
                    [
                        "table"=> "usergroups",
                        "field"=> "userid"
                    ]
                ]
            ]
        ],
        "relations"=> [
            "groups"=> [
                "table"=> "usergroups",
                "field"=> "userid",
                "type"=> "inbound"
            ]
        ]
    ],
    "employees_names"=> [
        "fields"=> [
            "id"=> [
                "iskey"=> true
            ]
        ],
        "keyFld"=> "id"
    ],
    "tags"=> [
        "fields"=> [
            "card"=> [
                "iskey"=> true
            ],
            "emplid"=> [
                "foreignKey"=> [
                    "table"=> "employees",
                    "field"=> "id"
                ]
            ]
        ],
        "relations"=> [
            "started_work"=> [
                "table"=> "started_work",
                "field"=> "card",
                "type"=> "inbound"
            ],
            "employees"=> [
                "table"=> "employees",
                "field"=> "id",
                "type"=> "outbound",
                "fkfield"=> "emplid"
            ],
            "alloc_orders"=> [
                "table"=> "alloc_orders",
                "field"=> "card",
                "type"=> "inbound"
            ]
        ],
        "keyFld"=> "card"
    ],
    "started_work"=> [
        "fields"=> [
            "id"=> [
                "iskey"=> true
            ]
        ],
        "relations"=> [],
        "description"=> "",
        "comment"=> "",
        "type"=> "view",
        "keyFld"=> "id"
    ],
    "alloc_orders"=> [
        "fields"=> [
            "unq"=> [
                "iskey"=> true
            ]
        ],
        "keyFld"=> "unq",
        "relations"=> [
            "tags"=> [
                "table"=> "tags",
                "field"=> "card",
                "type"=> "outbound",
                "fkfield"=> "card"
            ]
        ]
    ],
    "tt_expanded"=> [
        "fields"=> [
            "id"=> [
                "iskey"=> true
            ]
        ],
        "keyFld"=> "id"
    ],
    "orders_extended"=> [
        "fields"=> [
            "oid"=> [
                "iskey"=> true
            ]
        ],
        "keyFld"=> "oid"
    ],
    "orders_count_bystate"=> [
        "fields"=> [
            "state"=> [
                "iskey"=> true
            ]
        ],
        "relations"=> [],
        "description"=> "",
        "comment"=> "",
        "type"=> "view",
        "keyFld"=> "state"
    ],
    "emplToOrdAssoc"=> [
        "fields"=> [
            "id"=> [
                "iskey"=> true
            ]
        ],
        "keyFld"=> "id"
    ],
    "employees"=> [
        "relations"=> [
            "emplToOrdAssoc"=> [
                "table"=> "emplToOrdAssoc",
                "field"=> "emplid",
                "type"=> "inbound"
            ]
        ]
    ],
    "employeesExtended"=> [
        "fields"=> [
            "id"=> [
                "iskey"=> true
            ],
            "team"=> [
                "foreignKey"=> [
                    "table"=> "teams",
                    "field"=> "tid"
                ]
            ]
        ],
        "keyFld"=> "id",
        "relations"=> [
            "team"=> [
                "table"=> "teams",
                "field"=> "tid",
                "type"=> "outbound",
                "fkfield"=> "team"
            ]
        ]
    ],
    "inventory_wmeta"=> [
        "fields"=> [
            "id"=> [
                "iskey"=> true
            ],
            "order"=> [
                "foreignKey"=> [
                    "table"=> "orders",
                    "field"=> "oid"
                ]
            ]
        ],
        "relations"=> [
            "order_id"=> [
                "table"=> "orders",
                "field"=> "oid",
                "type"=> "outbound",
                "fkfield"=> "order_id"
            ]
        ],
        "keyFld"=> "id"
    ],
    "inventory_extented"=> [
        "fields"=> [
            "id"=> [
                "iskey"=> true
            ],
            "order"=> [
                "foreignKey"=> [
                    "table"=> "orders",
                    "field"=> "oid"
                ]
            ]
        ],
        "relations"=> [
            "order_id"=> [
                "table"=> "orders",
                "field"=> "oid",
                "type"=> "outbound",
                "fkfield"=> "order_id"
            ]
        ],
        "keyFld"=> "id"
    ],
    "orders"=> [
        "relations"=> [
            "inventory_wmeta"=> [
                "table"=> "inventory_wmeta",
                "field"=> "order",
                "type"=> "inbound"
            ],
            "inventory_extented"=> [
                "table"=> "inventory_extented",
                "field"=> "order",
                "type"=> "inbound"
            ]
        ]
    ],
    "dlvrcontents_expanded"=> [
        "fields"=> [
            "id"=> [
                "iskey"=> true
            ]
        ],
        "keyFld"=> "id"
    ],
    "deliveries"=> [
        "relations"=> [
            "dlvrcontents_expanded"=> [
                "table"=> "dlvrcontents_expanded",
                "field"=> "delivery",
                "type"=> "inbound"
            ]
        ]
    ],
    "timetracking_wdiff"=> [
        "fields"=> [
            "id"=> [
                "iskey"=> true
            ],
            "employee"=> [
                "foreignKey"=> [
                    "table"=> "employees",
                    "field"=> "id"
                ]
            ],
            "currency"=> [
                "foreignKey"=> [
                    "table"=> "currencies",
                    "field"=> "id"
                ]
            ],
            "operation"=> [
                "foreignKey"=> [
                    "table"=> "operations",
                    "field"=> "id"
                ]
            ],
            "order"=> [
                "foreignKey"=> [
                    "table"=> "orders",
                    "field"=> "oid"
                ]
            ]
        ],
        "keyFld"=> "id",
        "relations"=> [
            "employee"=> [
                "table"=> "employees",
                "field"=> "id",
                "type"=> "outbound",
                "fkfield"=> "employee"
            ],
            "operation"=> [
                "table"=> "operations",
                "field"=> "id",
                "type"=> "outbound",
                "fkfield"=> "operation"
            ],
            "order"=> [
                "table"=> "orders",
                "field"=> "oid",
                "type"=> "outbound",
                "fkfield"=> "order"
            ],
            "currency"=> [
                "table"=> "currencies",
                "field"=> "id",
                "type"=> "outbound",
                "fkfield"=> "currency"
            ]
        ]
    ]
];