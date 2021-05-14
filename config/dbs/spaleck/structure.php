<?php
return [
    "access_rights"=> [
        "fields"=> [
            "name"=> [
                "description"=> "",
                "name"=> "name",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "40"
                ],
                "iskey"=> true,
                "required"=> true,
                "default"=> null,
                "referencedBy"=> [
                    [
                        "table"=> "users_rights",
                        "field"=> "access_rights_name"
                    ]
                ]
            ]
        ],
        "name"=> "access_rights",
        "description"=> "",
        "comment"=> "",
        "type"=> "table",
        "keyFld"=> "name",
        "relations"=> [
            "users_rights"=> [
                "table"=> "users_rights",
                "field"=> "access_rights_name",
                "type"=> "inbound"
            ]
        ]
    ],
    "alloc_orders"=> [
        "fields"=> [
            "card"=> [
                "description"=> "",
                "name"=> "card",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "30"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "currency"=> [
                "description"=> "",
                "name"=> "currency",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "10"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "emplid"=> [
                "description"=> "",
                "name"=> "emplid",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> "0"
            ],
            "fname"=> [
                "description"=> "",
                "name"=> "fname",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "45"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null
            ],
            "hourlyrate"=> [
                "description"=> "",
                "name"=> "hourlyrate",
                "comment"=> "",
                "type"=> [
                    "proto"=> "float"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "lname"=> [
                "description"=> "",
                "name"=> "lname",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "45"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null
            ],
            "op_id"=> [
                "description"=> "",
                "name"=> "op_id",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> "0"
            ],
            "op_name"=> [
                "description"=> "",
                "name"=> "op_name",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "50"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "order_id"=> [
                "description"=> "",
                "name"=> "order_id",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> "0"
            ],
            "order_name"=> [
                "description"=> "",
                "name"=> "order_name",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "45"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "unq"=> [
                "description"=> "",
                "name"=> "unq",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "106"
                ],
                "iskey"=> true,
                "required"=> false,
                "default"=> null
            ]
        ],
        "relations"=> [
            "tags"=> [
                "table"=> "tags",
                "field"=> "card",
                "type"=> "outbound",
                "fkfield"=> "card"
            ]
        ],
        "description"=> "",
        "comment"=> "",
        "type"=> "view",
        "keyFld"=> "unq"
    ],
    "assets"=> [
        "fields"=> [
            "aid"=> [
                "description"=> "",
                "name"=> "aid",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> true,
                "required"=> false,
                "default"=> null,
                "referencedBy"=> [
                    [
                        "table"=> "maintenance",
                        "field"=> "assets_aid"
                    ]
                ]
            ],
            "catalog_catid"=> [
                "description"=> "",
                "name"=> "catalog_catid",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null,
                "foreignKey"=> [
                    "table"=> "catalog",
                    "field"=> "catid"
                ]
            ],
            "employeeid"=> [
                "description"=> "",
                "name"=> "employeeid",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null,
                "foreignKey"=> [
                    "table"=> "employees",
                    "field"=> "id"
                ]
            ],
            "location"=> [
                "description"=> "",
                "name"=> "location",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "45"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "model"=> [
                "description"=> "",
                "name"=> "model",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "45"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "name"=> [
                "description"=> "",
                "name"=> "name",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "45"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "sn"=> [
                "description"=> "",
                "name"=> "sn",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "100"
                ],
                "iskey"=> true,
                "required"=> false,
                "default"=> null
            ],
            "type"=> [
                "description"=> "",
                "name"=> "type",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "45"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "vendor"=> [
                "description"=> "",
                "name"=> "vendor",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "45"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ]
        ],
        "name"=> "assets",
        "description"=> "",
        "comment"=> "",
        "type"=> "table",
        "keyFld"=> "aid",
        "relations"=> [
            "employeeid"=> [
                "table"=> "employees",
                "field"=> "id",
                "type"=> "outbound",
                "fkfield"=> "employeeid"
            ],
            "catalog_catid"=> [
                "table"=> "catalog",
                "field"=> "catid",
                "type"=> "outbound",
                "fkfield"=> "catalog_catid"
            ],
            "maintenance"=> [
                "table"=> "maintenance",
                "field"=> "assets_aid",
                "type"=> "inbound"
            ]
        ]
    ],
    "assignemnts"=> [
        "fields"=> [
            "currency"=> [
                "description"=> "",
                "name"=> "currency",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "10"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null,
                "foreignKey"=> [
                    "table"=> "currencies",
                    "field"=> "id"
                ]
            ],
            "employees_id"=> [
                "description"=> "",
                "name"=> "employees_id",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null,
                "foreignKey"=> [
                    "table"=> "employees",
                    "field"=> "id"
                ]
            ],
            "hourly_rate"=> [
                "description"=> "",
                "name"=> "hourly_rate",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "45"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "id"=> [
                "description"=> "",
                "name"=> "id",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> true,
                "required"=> true,
                "default"=> null
            ],
            "order"=> [
                "description"=> "",
                "name"=> "order",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null,
                "foreignKey"=> [
                    "table"=> "orders",
                    "field"=> "oid"
                ]
            ]
        ],
        "name"=> "assignemnts",
        "description"=> "",
        "comment"=> "",
        "type"=> "table",
        "keyFld"=> "id",
        "relations"=> [
            "employees_id"=> [
                "table"=> "employees",
                "field"=> "id",
                "type"=> "outbound",
                "fkfield"=> "employees_id"
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
    ],
    "catalog"=> [
        "fields"=> [
            "active"=> [
                "description"=> "",
                "name"=> "active",
                "comment"=> "",
                "type"=> [
                    "proto"=> "tinyint"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> "1"
            ],
            "catid"=> [
                "description"=> "",
                "name"=> "catid",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> true,
                "required"=> false,
                "default"=> null,
                "referencedBy"=> [
                    [
                        "table"=> "assets",
                        "field"=> "catalog_catid"
                    ],
                    [
                        "table"=> "catalog_product_structure",
                        "field"=> "parent"
                    ],
                    [
                        "table"=> "catalog_product_structure",
                        "field"=> "item"
                    ],
                    [
                        "table"=> "catalog_properties",
                        "field"=> "catid"
                    ],
                    [
                        "table"=> "employees_ops",
                        "field"=> "catalog_id"
                    ],
                    [
                        "table"=> "orders_parts",
                        "field"=> "catalog_id"
                    ],
                    [
                        "table"=> "stocks_content",
                        "field"=> "catalog_id"
                    ],
                    [
                        "table"=> "stocks_initial",
                        "field"=> "catalog_catid"
                    ],
                    [
                        "table"=> "stocks_registry",
                        "field"=> "catalog_id"
                    ]
                ]
            ],
            "code"=> [
                "description"=> "",
                "name"=> "code",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "45"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "currency"=> [
                "description"=> "",
                "name"=> "currency",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "10"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null,
                "foreignKey"=> [
                    "table"=> "currencies",
                    "field"=> "id"
                ]
            ],
            "default_stock"=> [
                "description"=> "",
                "name"=> "default_stock",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null,
                "foreignKey"=> [
                    "table"=> "stocks",
                    "field"=> "id"
                ]
            ],
            "docs"=> [
                "description"=> "",
                "name"=> "docs",
                "comment"=> "",
                "type"=> [
                    "proto"=> "text"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "name"=> [
                "description"=> "",
                "name"=> "name",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "45"
                ],
                "iskey"=> true,
                "required"=> true,
                "default"=> null
            ],
            "type"=> [
                "description"=> "",
                "name"=> "type",
                "comment"=> "",
                "type"=> [
                    "proto"=> "enum",
                    "vals"=> [
                        "pcomposed",
                        "product",
                        "service",
                        "asset"
                    ]
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null
            ],
            "unit_price"=> [
                "description"=> "",
                "name"=> "unit_price",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "45"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "units_unit"=> [
                "description"=> "",
                "name"=> "units_unit",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "45"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null,
                "foreignKey"=> [
                    "table"=> "units",
                    "field"=> "unit"
                ]
            ]
        ],
        "name"=> "catalog",
        "description"=> "",
        "comment"=> "",
        "type"=> "table",
        "keyFld"=> "catid",
        "relations"=> [
            "units_unit"=> [
                "table"=> "units",
                "field"=> "unit",
                "type"=> "outbound",
                "fkfield"=> "units_unit"
            ],
            "default_stock"=> [
                "table"=> "stocks",
                "field"=> "id",
                "type"=> "outbound",
                "fkfield"=> "default_stock"
            ],
            "currency"=> [
                "table"=> "currencies",
                "field"=> "id",
                "type"=> "outbound",
                "fkfield"=> "currency"
            ],
            "assets"=> [
                "table"=> "assets",
                "field"=> "catalog_catid",
                "type"=> "inbound"
            ],
            "catalog_product_structure"=> [
                "table"=> "catalog_product_structure",
                "field"=> "item",
                "type"=> "inbound"
            ],
            "catalog_product_structure_item"=> [
                "table"=> "catalog_product_structure",
                "field"=> "item",
                "type"=> "inbound"
            ],
            "catalog_product_structure_parent"=> [
                "table"=> "catalog_product_structure",
                "field"=> "parent",
                "type"=> "inbound"
            ],
            "catalog_properties"=> [
                "table"=> "catalog_properties",
                "field"=> "catid",
                "type"=> "inbound"
            ],
            "employees_ops"=> [
                "table"=> "employees_ops",
                "field"=> "catalog_id",
                "type"=> "inbound"
            ],
            "orders_parts"=> [
                "table"=> "orders_parts",
                "field"=> "catalog_id",
                "type"=> "inbound"
            ],
            "stocks_content"=> [
                "table"=> "stocks_content",
                "field"=> "catalog_id",
                "type"=> "inbound"
            ],
            "stocks_initial"=> [
                "table"=> "stocks_initial",
                "field"=> "catalog_catid",
                "type"=> "inbound"
            ],
            "stocks_registry"=> [
                "table"=> "stocks_registry",
                "field"=> "catalog_id",
                "type"=> "inbound"
            ]
        ]
    ],
    "catalog_product_structure"=> [
        "fields"=> [
            "id"=> [
                "description"=> "",
                "name"=> "id",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> true,
                "required"=> false,
                "default"=> null
            ],
            "item"=> [
                "description"=> "",
                "name"=> "item",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null,
                "foreignKey"=> [
                    "table"=> "catalog",
                    "field"=> "catid"
                ]
            ],
            "parent"=> [
                "description"=> "",
                "name"=> "parent",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null,
                "foreignKey"=> [
                    "table"=> "catalog",
                    "field"=> "catid"
                ]
            ],
            "qty"=> [
                "description"=> "",
                "name"=> "qty",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "45"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ]
        ],
        "name"=> "catalog_product_structure",
        "description"=> "",
        "comment"=> "",
        "type"=> "table",
        "keyFld"=> "id",
        "relations"=> [
            "parent"=> [
                "table"=> "catalog",
                "field"=> "catid",
                "type"=> "outbound",
                "fkfield"=> "parent"
            ],
            "item"=> [
                "table"=> "catalog",
                "field"=> "catid",
                "type"=> "outbound",
                "fkfield"=> "item"
            ]
        ]
    ],
    "catalog_properties"=> [
        "fields"=> [
            "catid"=> [
                "description"=> "",
                "name"=> "catid",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null,
                "foreignKey"=> [
                    "table"=> "catalog",
                    "field"=> "catid"
                ]
            ],
            "id"=> [
                "description"=> "",
                "name"=> "id",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> true,
                "required"=> true,
                "default"=> null
            ],
            "name"=> [
                "description"=> "",
                "name"=> "name",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "45"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null
            ],
            "unit"=> [
                "description"=> "",
                "name"=> "unit",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "45"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "val"=> [
                "description"=> "",
                "name"=> "val",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "255"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null
            ]
        ],
        "name"=> "catalog_properties",
        "description"=> "",
        "comment"=> "",
        "type"=> "table",
        "keyFld"=> "id",
        "relations"=> [
            "catid"=> [
                "table"=> "catalog",
                "field"=> "catid",
                "type"=> "outbound",
                "fkfield"=> "catid"
            ]
        ]
    ],
    "currencies"=> [
        "fields"=> [
            "desc"=> [
                "description"=> "",
                "name"=> "desc",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "45"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "id"=> [
                "description"=> "",
                "name"=> "id",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "10"
                ],
                "iskey"=> true,
                "required"=> true,
                "default"=> null,
                "referencedBy"=> [
                    [
                        "table"=> "assignemnts",
                        "field"=> "currency"
                    ],
                    [
                        "table"=> "catalog",
                        "field"=> "currency"
                    ],
                    [
                        "table"=> "currency_series",
                        "field"=> "currency"
                    ],
                    [
                        "table"=> "operations",
                        "field"=> "currency"
                    ],
                    [
                        "table"=> "orders_2_employees",
                        "field"=> "currency"
                    ],
                    [
                        "table"=> "stocks_initial",
                        "field"=> "currency"
                    ],
                    [
                        "table"=> "timetracking",
                        "field"=> "currency"
                    ]
                ]
            ],
            "prio"=> [
                "description"=> "",
                "name"=> "prio",
                "comment"=> "",
                "type"=> [
                    "proto"=> "tinyint"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> "0"
            ]
        ],
        "name"=> "currencies",
        "description"=> "",
        "comment"=> "",
        "type"=> "table",
        "keyFld"=> "id",
        "relations"=> [
            "assignemnts"=> [
                "table"=> "assignemnts",
                "field"=> "currency",
                "type"=> "inbound"
            ],
            "catalog"=> [
                "table"=> "catalog",
                "field"=> "currency",
                "type"=> "inbound"
            ],
            "currency_series"=> [
                "table"=> "currency_series",
                "field"=> "currency",
                "type"=> "inbound"
            ],
            "operations"=> [
                "table"=> "operations",
                "field"=> "currency",
                "type"=> "inbound"
            ],
            "orders_2_employees"=> [
                "table"=> "orders_2_employees",
                "field"=> "currency",
                "type"=> "inbound"
            ],
            "stocks_initial"=> [
                "table"=> "stocks_initial",
                "field"=> "currency",
                "type"=> "inbound"
            ],
            "timetracking"=> [
                "table"=> "timetracking",
                "field"=> "currency",
                "type"=> "inbound"
            ]
        ]
    ],
    "currency_series"=> [
        "fields"=> [
            "currency"=> [
                "description"=> "",
                "name"=> "currency",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "10"
                ],
                "iskey"=> true,
                "required"=> true,
                "default"=> null,
                "foreignKey"=> [
                    "table"=> "currencies",
                    "field"=> "id"
                ]
            ],
            "ts"=> [
                "description"=> "",
                "name"=> "ts",
                "comment"=> "",
                "type"=> [
                    "proto"=> "datetime"
                ],
                "iskey"=> true,
                "required"=> true,
                "default"=> null
            ]
        ],
        "name"=> "currency_series",
        "description"=> "",
        "comment"=> "",
        "type"=> "table",
        "keyFld"=> "ts",
        "relations"=> [
            "currency"=> [
                "table"=> "currencies",
                "field"=> "id",
                "type"=> "outbound",
                "fkfield"=> "currency"
            ]
        ]
    ],
    "documents"=> [
        "fields"=> [
            "docnum"=> [
                "description"=> "",
                "name"=> "docnum",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "45"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null
            ],
            "id"=> [
                "description"=> "",
                "name"=> "id",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> true,
                "required"=> false,
                "default"=> null,
                "referencedBy"=> [
                    [
                        "table"=> "orders",
                        "field"=> "doc_id"
                    ],
                    [
                        "table"=> "stocks_registry",
                        "field"=> "documents_docid"
                    ]
                ]
            ],
            "issued_date"=> [
                "description"=> "",
                "name"=> "issued_date",
                "comment"=> "",
                "type"=> [
                    "proto"=> "datetime"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> "CURRENT_TIMESTAMP"
            ],
            "partners_id"=> [
                "description"=> "",
                "name"=> "partners_id",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null,
                "foreignKey"=> [
                    "table"=> "partners",
                    "field"=> "id"
                ]
            ],
            "type"=> [
                "description"=> "",
                "name"=> "type",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "50"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null,
                "foreignKey"=> [
                    "table"=> "settings_document_types",
                    "field"=> "type"
                ]
            ],
            "userid"=> [
                "description"=> "",
                "name"=> "userid",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "20"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null,
                "foreignKey"=> [
                    "table"=> "users",
                    "field"=> "userid"
                ]
            ]
        ],
        "name"=> "documents",
        "description"=> "",
        "comment"=> "",
        "type"=> "table",
        "keyFld"=> "id",
        "relations"=> [
            "userid"=> [
                "table"=> "users",
                "field"=> "userid",
                "type"=> "outbound",
                "fkfield"=> "userid"
            ],
            "partners_id"=> [
                "table"=> "partners",
                "field"=> "id",
                "type"=> "outbound",
                "fkfield"=> "partners_id"
            ],
            "type"=> [
                "table"=> "settings_document_types",
                "field"=> "type",
                "type"=> "outbound",
                "fkfield"=> "type"
            ],
            "orders"=> [
                "table"=> "orders",
                "field"=> "doc_id",
                "type"=> "inbound"
            ],
            "stocks_registry"=> [
                "table"=> "stocks_registry",
                "field"=> "documents_docid",
                "type"=> "inbound"
            ]
        ]
    ],
    "employees"=> [
        "fields"=> [
            "activ"=> [
                "description"=> "",
                "name"=> "activ",
                "comment"=> "",
                "type"=> [
                    "proto"=> "tinyint"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> "1"
            ],
            "address_1"=> [
                "description"=> "",
                "name"=> "address_1",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "45"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null
            ],
            "address_2"=> [
                "description"=> "",
                "name"=> "address_2",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "45"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "bdate"=> [
                "description"=> "",
                "name"=> "bdate",
                "comment"=> "",
                "type"=> [
                    "proto"=> "date"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null
            ],
            "card"=> [
                "description"=> "",
                "name"=> "card",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "30"
                ],
                "iskey"=> true,
                "required"=> false,
                "default"=> null
            ],
            "city"=> [
                "description"=> "",
                "name"=> "city",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "45"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null
            ],
            "cnp"=> [
                "description"=> "",
                "name"=> "cnp",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "15"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null
            ],
            "country"=> [
                "description"=> "",
                "name"=> "country",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "45"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> "Romania"
            ],
            "county"=> [
                "description"=> "",
                "name"=> "county",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "45"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null
            ],
            "docs"=> [
                "description"=> "",
                "name"=> "docs",
                "comment"=> "",
                "type"=> [
                    "proto"=> "text"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "fname"=> [
                "description"=> "",
                "name"=> "fname",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "45"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null
            ],
            "id"=> [
                "description"=> "",
                "name"=> "id",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> true,
                "required"=> false,
                "default"=> null,
                "referencedBy"=> [
                    [
                        "table"=> "assets",
                        "field"=> "employeeid"
                    ],
                    [
                        "table"=> "assignemnts",
                        "field"=> "employees_id"
                    ],
                    [
                        "table"=> "employees_ops",
                        "field"=> "employees_id"
                    ],
                    [
                        "table"=> "orders_2_employees",
                        "field"=> "emplid"
                    ],
                    [
                        "table"=> "teams",
                        "field"=> "teamlead"
                    ],
                    [
                        "table"=> "timetracking",
                        "field"=> "employee"
                    ]
                ]
            ],
            "jobtitle"=> [
                "description"=> "",
                "name"=> "jobtitle",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "50"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null,
                "foreignKey"=> [
                    "table"=> "jobs",
                    "field"=> "codcor"
                ]
            ],
            "lname"=> [
                "description"=> "",
                "name"=> "lname",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "45"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null
            ],
            "postcode"=> [
                "description"=> "",
                "name"=> "postcode",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "team"=> [
                "description"=> "",
                "name"=> "team",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null,
                "foreignKey"=> [
                    "table"=> "teams",
                    "field"=> "tid"
                ]
            ],
            "userid"=> [
                "description"=> "",
                "name"=> "userid",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "20"
                ],
                "iskey"=> true,
                "required"=> false,
                "default"=> null,
                "foreignKey"=> [
                    "table"=> "users",
                    "field"=> "userid"
                ]
            ]
        ],
        "name"=> "employees",
        "description"=> "",
        "comment"=> "",
        "type"=> "table",
        "keyFld"=> "id",
        "relations"=> [
            "userid"=> [
                "table"=> "users",
                "field"=> "userid",
                "type"=> "outbound",
                "fkfield"=> "userid"
            ],
            "team"=> [
                "table"=> "teams",
                "field"=> "tid",
                "type"=> "outbound",
                "fkfield"=> "team"
            ],
            "jobtitle"=> [
                "table"=> "jobs",
                "field"=> "codcor",
                "type"=> "outbound",
                "fkfield"=> "jobtitle"
            ],
            "assets"=> [
                "table"=> "assets",
                "field"=> "employeeid",
                "type"=> "inbound"
            ],
            "assignemnts"=> [
                "table"=> "assignemnts",
                "field"=> "employees_id",
                "type"=> "inbound"
            ],
            "employees_ops"=> [
                "table"=> "employees_ops",
                "field"=> "employees_id",
                "type"=> "inbound"
            ],
            "orders_2_employees"=> [
                "table"=> "orders_2_employees",
                "field"=> "emplid",
                "type"=> "inbound"
            ],
            "teams"=> [
                "table"=> "teams",
                "field"=> "teamlead",
                "type"=> "inbound"
            ],
            "timetracking"=> [
                "table"=> "timetracking",
                "field"=> "employee",
                "type"=> "inbound"
            ]
        ]
    ],
    "employees_names"=> [
        "fields"=> [
            "fullname"=> [
                "description"=> "",
                "name"=> "fullname",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "91"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> ""
            ],
            "id"=> [
                "description"=> "",
                "name"=> "id",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> true,
                "required"=> true,
                "default"=> "0"
            ]
        ],
        "relations"=> [],
        "description"=> "",
        "comment"=> "",
        "type"=> "view",
        "keyFld"=> "id"
    ],
    "employees_ops"=> [
        "fields"=> [
            "catalog_id"=> [
                "description"=> "",
                "name"=> "catalog_id",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null,
                "foreignKey"=> [
                    "table"=> "catalog",
                    "field"=> "catid"
                ]
            ],
            "employees_id"=> [
                "description"=> "",
                "name"=> "employees_id",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null,
                "foreignKey"=> [
                    "table"=> "employees",
                    "field"=> "id"
                ]
            ],
            "id"=> [
                "description"=> "",
                "name"=> "id",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> true,
                "required"=> true,
                "default"=> null
            ]
        ],
        "name"=> "employees_ops",
        "description"=> "",
        "comment"=> "",
        "type"=> "table",
        "keyFld"=> "id",
        "relations"=> [
            "catalog_id"=> [
                "table"=> "catalog",
                "field"=> "catid",
                "type"=> "outbound",
                "fkfield"=> "catalog_id"
            ],
            "employees_id"=> [
                "table"=> "employees",
                "field"=> "id",
                "type"=> "outbound",
                "fkfield"=> "employees_id"
            ]
        ]
    ],
    "groups"=> [
        "fields"=> [
            "description"=> [
                "description"=> "",
                "name"=> "description",
                "comment"=> "",
                "type"=> [
                    "proto"=> "text"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null
            ],
            "groupid"=> [
                "description"=> "",
                "name"=> "groupid",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "50"
                ],
                "iskey"=> true,
                "required"=> true,
                "default"=> null,
                "referencedBy"=> [
                    [
                        "table"=> "users_2_groups",
                        "field"=> "groupid"
                    ]
                ]
            ]
        ],
        "name"=> "groups",
        "description"=> "",
        "comment"=> "",
        "type"=> "table",
        "keyFld"=> "groupid",
        "relations"=> [
            "users_2_groups"=> [
                "table"=> "users_2_groups",
                "field"=> "groupid",
                "type"=> "inbound"
            ]
        ]
    ],
    "jobs"=> [
        "fields"=> [
            "codcor"=> [
                "description"=> "",
                "name"=> "codcor",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "50"
                ],
                "iskey"=> true,
                "required"=> true,
                "default"=> null,
                "referencedBy"=> [
                    [
                        "table"=> "employees",
                        "field"=> "jobtitle"
                    ]
                ]
            ],
            "name"=> [
                "description"=> "",
                "name"=> "name",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "100"
                ],
                "iskey"=> true,
                "required"=> true,
                "default"=> null
            ]
        ],
        "name"=> "jobs",
        "description"=> "",
        "comment"=> "",
        "type"=> "table",
        "keyFld"=> "codcor",
        "relations"=> [
            "employees"=> [
                "table"=> "employees",
                "field"=> "jobtitle",
                "type"=> "inbound"
            ]
        ]
    ],
    "maintenance"=> [
        "fields"=> [
            "assets_aid"=> [
                "description"=> "",
                "name"=> "assets_aid",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null,
                "foreignKey"=> [
                    "table"=> "assets",
                    "field"=> "aid"
                ]
            ],
            "document_docid"=> [
                "description"=> "",
                "name"=> "document_docid",
                "comment"=> "",
                "type"=> [
                    "proto"=> "text"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "exec_date"=> [
                "description"=> "",
                "name"=> "exec_date",
                "comment"=> "",
                "type"=> [
                    "proto"=> "datetime"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "execby"=> [
                "description"=> "",
                "name"=> "execby",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "20"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null,
                "foreignKey"=> [
                    "table"=> "users",
                    "field"=> "userid"
                ]
            ],
            "id"=> [
                "description"=> "",
                "name"=> "id",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> true,
                "required"=> true,
                "default"=> null
            ],
            "operation"=> [
                "description"=> "",
                "name"=> "operation",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "45"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "scheduled_date"=> [
                "description"=> "",
                "name"=> "scheduled_date",
                "comment"=> "",
                "type"=> [
                    "proto"=> "datetime"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null
            ]
        ],
        "name"=> "maintenance",
        "description"=> "",
        "comment"=> "",
        "type"=> "table",
        "keyFld"=> "id",
        "relations"=> [
            "assets_aid"=> [
                "table"=> "assets",
                "field"=> "aid",
                "type"=> "outbound",
                "fkfield"=> "assets_aid"
            ],
            "execby"=> [
                "table"=> "users",
                "field"=> "userid",
                "type"=> "outbound",
                "fkfield"=> "execby"
            ]
        ]
    ],
    "operations"=> [
        "fields"=> [
            "currency"=> [
                "description"=> "",
                "name"=> "currency",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "10"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null,
                "foreignKey"=> [
                    "table"=> "currencies",
                    "field"=> "id"
                ]
            ],
            "desc"=> [
                "description"=> "",
                "name"=> "desc",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "255"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null
            ],
            "hourly_price"=> [
                "description"=> "",
                "name"=> "hourly_price",
                "comment"=> "",
                "type"=> [
                    "proto"=> "float",
                    "length"=> "10,2"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null
            ],
            "id"=> [
                "description"=> "",
                "name"=> "id",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> true,
                "required"=> false,
                "default"=> null,
                "referencedBy"=> [
                    [
                        "table"=> "orders_2_employees",
                        "field"=> "operation"
                    ],
                    [
                        "table"=> "timetracking",
                        "field"=> "operation"
                    ]
                ]
            ],
            "name"=> [
                "description"=> "",
                "name"=> "name",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "50"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null
            ]
        ],
        "name"=> "operations",
        "description"=> "",
        "comment"=> "",
        "type"=> "table",
        "keyFld"=> "id",
        "relations"=> [
            "currency"=> [
                "table"=> "currencies",
                "field"=> "id",
                "type"=> "outbound",
                "fkfield"=> "currency"
            ],
            "orders_2_employees"=> [
                "table"=> "orders_2_employees",
                "field"=> "operation",
                "type"=> "inbound"
            ],
            "timetracking"=> [
                "table"=> "timetracking",
                "field"=> "operation",
                "type"=> "inbound"
            ]
        ]
    ],
    "orders"=> [
        "fields"=> [
            "closed_on"=> [
                "description"=> "",
                "name"=> "closed_on",
                "comment"=> "",
                "type"=> [
                    "proto"=> "datetime"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "created_by"=> [
                "description"=> "",
                "name"=> "created_by",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "20"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null,
                "foreignKey"=> [
                    "table"=> "users",
                    "field"=> "userid"
                ]
            ],
            "created_on"=> [
                "description"=> "",
                "name"=> "created_on",
                "comment"=> "",
                "type"=> [
                    "proto"=> "datetime"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> "CURRENT_TIMESTAMP"
            ],
            "doc_id"=> [
                "description"=> "",
                "name"=> "doc_id",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null,
                "foreignKey"=> [
                    "table"=> "documents",
                    "field"=> "id"
                ]
            ],
            "estimated_value"=> [
                "description"=> "",
                "name"=> "estimated_value",
                "comment"=> "",
                "type"=> [
                    "proto"=> "float",
                    "length"=> "10,2"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "final_value"=> [
                "description"=> "",
                "name"=> "final_value",
                "comment"=> "",
                "type"=> [
                    "proto"=> "float",
                    "length"=> "10,2"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "label"=> [
                "description"=> "",
                "name"=> "label",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "255"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null
            ],
            "meta"=> [
                "description"=> "",
                "name"=> "meta",
                "comment"=> "",
                "type"=> [
                    "proto"=> "json"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "oid"=> [
                "description"=> "",
                "name"=> "oid",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> true,
                "required"=> false,
                "default"=> null,
                "referencedBy"=> [
                    [
                        "table"=> "assignemnts",
                        "field"=> "order"
                    ],
                    [
                        "table"=> "orders_2_employees",
                        "field"=> "orderid"
                    ],
                    [
                        "table"=> "orders_metaproperties",
                        "field"=> "order_id"
                    ],
                    [
                        "table"=> "orders_parts",
                        "field"=> "order"
                    ],
                    [
                        "table"=> "timetracking",
                        "field"=> "order"
                    ]
                ]
            ],
            "partner_id"=> [
                "description"=> "",
                "name"=> "partner_id",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null,
                "foreignKey"=> [
                    "table"=> "partners",
                    "field"=> "id"
                ]
            ],
            "state"=> [
                "description"=> "",
                "name"=> "state",
                "comment"=> "",
                "type"=> [
                    "proto"=> "enum",
                    "vals"=> [
                        "offer",
                        "ord",
                        "proc",
                        "ctc",
                        "fix",
                        "ready",
                        "dlvd"
                    ]
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> "ord"
            ]
        ],
        "name"=> "orders",
        "description"=> "",
        "comment"=> "",
        "type"=> "table",
        "keyFld"=> "oid",
        "relations"=> [
            "doc_id"=> [
                "table"=> "documents",
                "field"=> "id",
                "type"=> "outbound",
                "fkfield"=> "doc_id"
            ],
            "partner_id"=> [
                "table"=> "partners",
                "field"=> "id",
                "type"=> "outbound",
                "fkfield"=> "partner_id"
            ],
            "created_by"=> [
                "table"=> "users",
                "field"=> "userid",
                "type"=> "outbound",
                "fkfield"=> "created_by"
            ],
            "assignemnts"=> [
                "table"=> "assignemnts",
                "field"=> "order",
                "type"=> "inbound"
            ],
            "orders_2_employees"=> [
                "table"=> "orders_2_employees",
                "field"=> "orderid",
                "type"=> "inbound"
            ],
            "orders_metaproperties"=> [
                "table"=> "orders_metaproperties",
                "field"=> "order_id",
                "type"=> "inbound"
            ],
            "orders_parts"=> [
                "table"=> "orders_parts",
                "field"=> "order",
                "type"=> "inbound"
            ],
            "timetracking"=> [
                "table"=> "timetracking",
                "field"=> "order",
                "type"=> "inbound"
            ]
        ]
    ],
    "orders_2_employees"=> [
        "fields"=> [
            "currency"=> [
                "description"=> "",
                "name"=> "currency",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "10"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null,
                "foreignKey"=> [
                    "table"=> "currencies",
                    "field"=> "id"
                ]
            ],
            "emplid"=> [
                "description"=> "",
                "name"=> "emplid",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null,
                "foreignKey"=> [
                    "table"=> "employees",
                    "field"=> "id"
                ]
            ],
            "hourlyrate"=> [
                "description"=> "",
                "name"=> "hourlyrate",
                "comment"=> "",
                "type"=> [
                    "proto"=> "float"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "id"=> [
                "description"=> "",
                "name"=> "id",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> true,
                "required"=> false,
                "default"=> null
            ],
            "operation"=> [
                "description"=> "",
                "name"=> "operation",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null,
                "foreignKey"=> [
                    "table"=> "operations",
                    "field"=> "id"
                ]
            ],
            "orderid"=> [
                "description"=> "",
                "name"=> "orderid",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null,
                "foreignKey"=> [
                    "table"=> "orders",
                    "field"=> "oid"
                ]
            ]
        ],
        "name"=> "orders_2_employees",
        "description"=> "",
        "comment"=> "",
        "type"=> "table",
        "keyFld"=> "id",
        "relations"=> [
            "orderid"=> [
                "table"=> "orders",
                "field"=> "oid",
                "type"=> "outbound",
                "fkfield"=> "orderid"
            ],
            "emplid"=> [
                "table"=> "employees",
                "field"=> "id",
                "type"=> "outbound",
                "fkfield"=> "emplid"
            ],
            "operation"=> [
                "table"=> "operations",
                "field"=> "id",
                "type"=> "outbound",
                "fkfield"=> "operation"
            ],
            "currency"=> [
                "table"=> "currencies",
                "field"=> "id",
                "type"=> "outbound",
                "fkfield"=> "currency"
            ]
        ]
    ],
    "orders_count_bystate"=> [
        "fields"=> [
            "cnt"=> [
                "description"=> "",
                "name"=> "cnt",
                "comment"=> "",
                "type"=> [
                    "proto"=> "bigint"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> "0"
            ],
            "state"=> [
                "description"=> "",
                "name"=> "state",
                "comment"=> "",
                "type"=> [
                    "proto"=> "enum",
                    "vals"=> [
                        "offer",
                        "ord",
                        "proc",
                        "ctc",
                        "fix",
                        "ready",
                        "dlvd"
                    ]
                ],
                "iskey"=> true,
                "required"=> false,
                "default"=> "ord"
            ]
        ],
        "relations"=> [],
        "description"=> "",
        "comment"=> "",
        "type"=> "view",
        "keyFld"=> "state"
    ],
    "orders_extended"=> [
        "fields"=> [
            "closed_on"=> [
                "description"=> "",
                "name"=> "closed_on",
                "comment"=> "",
                "type"=> [
                    "proto"=> "datetime"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "created_by"=> [
                "description"=> "",
                "name"=> "created_by",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "20"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "created_on"=> [
                "description"=> "",
                "name"=> "created_on",
                "comment"=> "",
                "type"=> [
                    "proto"=> "datetime"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> "CURRENT_TIMESTAMP"
            ],
            "doc_id"=> [
                "description"=> "",
                "name"=> "doc_id",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "docnum"=> [
                "description"=> "",
                "name"=> "docnum",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "45"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "estimated_value"=> [
                "description"=> "",
                "name"=> "estimated_value",
                "comment"=> "",
                "type"=> [
                    "proto"=> "float",
                    "length"=> "10,2"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "final_value"=> [
                "description"=> "",
                "name"=> "final_value",
                "comment"=> "",
                "type"=> [
                    "proto"=> "float",
                    "length"=> "10,2"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "label"=> [
                "description"=> "",
                "name"=> "label",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "255"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null
            ],
            "meta"=> [
                "description"=> "",
                "name"=> "meta",
                "comment"=> "",
                "type"=> [
                    "proto"=> "json"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "oid"=> [
                "description"=> "",
                "name"=> "oid",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> true,
                "required"=> true,
                "default"=> "0"
            ],
            "partner_id"=> [
                "description"=> "",
                "name"=> "partner_id",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null
            ],
            "pname"=> [
                "description"=> "",
                "name"=> "pname",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "255"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "state"=> [
                "description"=> "",
                "name"=> "state",
                "comment"=> "",
                "type"=> [
                    "proto"=> "enum",
                    "vals"=> [
                        "offer",
                        "ord",
                        "proc",
                        "ctc",
                        "fix",
                        "ready",
                        "dlvd"
                    ]
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> "ord"
            ]
        ],
        "relations"=> [],
        "description"=> "",
        "comment"=> "",
        "type"=> "view",
        "keyFld"=> "oid"
    ],
    "orders_metaproperties"=> [
        "fields"=> [
            "id"=> [
                "description"=> "",
                "name"=> "id",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> true,
                "required"=> false,
                "default"=> null
            ],
            "order_id"=> [
                "description"=> "",
                "name"=> "order_id",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null,
                "foreignKey"=> [
                    "table"=> "orders",
                    "field"=> "oid"
                ]
            ],
            "prop"=> [
                "description"=> "",
                "name"=> "prop",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "255"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null
            ],
            "value"=> [
                "description"=> "",
                "name"=> "value",
                "comment"=> "",
                "type"=> [
                    "proto"=> "text"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null
            ]
        ],
        "name"=> "orders_metaproperties",
        "description"=> "",
        "comment"=> "",
        "type"=> "table",
        "keyFld"=> "id",
        "relations"=> [
            "order_id"=> [
                "table"=> "orders",
                "field"=> "oid",
                "type"=> "outbound",
                "fkfield"=> "order_id"
            ]
        ]
    ],
    "orders_parts"=> [
        "fields"=> [
            "catalog_id"=> [
                "description"=> "",
                "name"=> "catalog_id",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null,
                "foreignKey"=> [
                    "table"=> "catalog",
                    "field"=> "catid"
                ]
            ],
            "currency"=> [
                "description"=> "",
                "name"=> "currency",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "10"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null
            ],
            "id"=> [
                "description"=> "",
                "name"=> "id",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> true,
                "required"=> false,
                "default"=> null,
                "referencedBy"=> [
                    [
                        "table"=> "stocks_registry",
                        "field"=> "oiid"
                    ]
                ]
            ],
            "meta"=> [
                "description"=> "",
                "name"=> "meta",
                "comment"=> "",
                "type"=> [
                    "proto"=> "json"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "name"=> [
                "description"=> "",
                "name"=> "name",
                "comment"=> "",
                "type"=> [
                    "proto"=> "tinytext"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null
            ],
            "order"=> [
                "description"=> "",
                "name"=> "order",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null,
                "foreignKey"=> [
                    "table"=> "orders",
                    "field"=> "oid"
                ]
            ],
            "qty"=> [
                "description"=> "",
                "name"=> "qty",
                "comment"=> "",
                "type"=> [
                    "proto"=> "float",
                    "length"=> "10,3"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "total_price"=> [
                "description"=> "",
                "name"=> "total_price",
                "comment"=> "",
                "type"=> [
                    "proto"=> "float",
                    "length"=> "10,2"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "um"=> [
                "description"=> "",
                "name"=> "um",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "45"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null
            ],
            "unit_price"=> [
                "description"=> "",
                "name"=> "unit_price",
                "comment"=> "",
                "type"=> [
                    "proto"=> "float",
                    "length"=> "10,2"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "vat_proc"=> [
                "description"=> "",
                "name"=> "vat_proc",
                "comment"=> "",
                "type"=> [
                    "proto"=> "float",
                    "length"=> "10,2"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "vat_value"=> [
                "description"=> "",
                "name"=> "vat_value",
                "comment"=> "",
                "type"=> [
                    "proto"=> "float",
                    "length"=> "10,2"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ]
        ],
        "name"=> "orders_parts",
        "description"=> "",
        "comment"=> "",
        "type"=> "table",
        "keyFld"=> "id",
        "relations"=> [
            "order"=> [
                "table"=> "orders",
                "field"=> "oid",
                "type"=> "outbound",
                "fkfield"=> "order"
            ],
            "catalog_id"=> [
                "table"=> "catalog",
                "field"=> "catid",
                "type"=> "outbound",
                "fkfield"=> "catalog_id"
            ],
            "stocks_registry"=> [
                "table"=> "stocks_registry",
                "field"=> "oiid",
                "type"=> "inbound"
            ]
        ]
    ],
    "partners"=> [
        "fields"=> [
            "address1"=> [
                "description"=> "",
                "name"=> "address1",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "255"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null
            ],
            "address2"=> [
                "description"=> "",
                "name"=> "address2",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "255"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "agent"=> [
                "description"=> "",
                "name"=> "agent",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "255"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "agent_name"=> [
                "description"=> "",
                "name"=> "agent_name",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "255"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "analitic"=> [
                "description"=> "",
                "name"=> "analitic",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "255"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "bank_account"=> [
                "description"=> "",
                "name"=> "bank_account",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "255"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "bank_name"=> [
                "description"=> "",
                "name"=> "bank_name",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "255"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "blocked"=> [
                "description"=> "",
                "name"=> "blocked",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "255"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "branch"=> [
                "description"=> "",
                "name"=> "branch",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "255"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "branch_rep"=> [
                "description"=> "",
                "name"=> "branch_rep",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "255"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "cb_card"=> [
                "description"=> "",
                "name"=> "cb_card",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "255"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "city"=> [
                "description"=> "",
                "name"=> "city",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "255"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null
            ],
            "cod_fiscal"=> [
                "description"=> "",
                "name"=> "cod_fiscal",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "255"
                ],
                "iskey"=> true,
                "required"=> false,
                "default"=> null
            ],
            "cod_saga"=> [
                "description"=> "",
                "name"=> "cod_saga",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "255"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "comments"=> [
                "description"=> "",
                "name"=> "comments",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "255"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "country"=> [
                "description"=> "",
                "name"=> "country",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "255"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null
            ],
            "county"=> [
                "description"=> "",
                "name"=> "county",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "255"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null
            ],
            "create_date"=> [
                "description"=> "",
                "name"=> "create_date",
                "comment"=> "",
                "type"=> [
                    "proto"=> "timestamp"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> "CURRENT_TIMESTAMP"
            ],
            "credit_limit"=> [
                "description"=> "",
                "name"=> "credit_limit",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "255"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "date_s_vat"=> [
                "description"=> "",
                "name"=> "date_s_vat",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "255"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "date_v_vat"=> [
                "description"=> "",
                "name"=> "date_v_vat",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "255"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "discount"=> [
                "description"=> "",
                "name"=> "discount",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "255"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "email"=> [
                "description"=> "",
                "name"=> "email",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "255"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "group"=> [
                "description"=> "",
                "name"=> "group",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "255"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "id"=> [
                "description"=> "",
                "name"=> "id",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> true,
                "required"=> false,
                "default"=> null,
                "referencedBy"=> [
                    [
                        "table"=> "documents",
                        "field"=> "partners_id"
                    ],
                    [
                        "table"=> "orders",
                        "field"=> "partner_id"
                    ]
                ]
            ],
            "is_customer"=> [
                "description"=> "",
                "name"=> "is_customer",
                "comment"=> "",
                "type"=> [
                    "proto"=> "tinyint",
                    "length"=> "1"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> "1"
            ],
            "is_supplier"=> [
                "description"=> "",
                "name"=> "is_supplier",
                "comment"=> "",
                "type"=> [
                    "proto"=> "tinyint",
                    "length"=> "1"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> "0"
            ],
            "is_vat"=> [
                "description"=> "",
                "name"=> "is_vat",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "255"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "license_plate"=> [
                "description"=> "",
                "name"=> "license_plate",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "255"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "name"=> [
                "description"=> "",
                "name"=> "name",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "255"
                ],
                "iskey"=> true,
                "required"=> false,
                "default"=> null
            ],
            "personal_id_issuer"=> [
                "description"=> "",
                "name"=> "personal_id_issuer",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "255"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "personal_id_number"=> [
                "description"=> "",
                "name"=> "personal_id_number",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "255"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "personal_id_serie"=> [
                "description"=> "",
                "name"=> "personal_id_serie",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "255"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "phone"=> [
                "description"=> "",
                "name"=> "phone",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "255"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "reg_com"=> [
                "description"=> "",
                "name"=> "reg_com",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "255"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "type_tert"=> [
                "description"=> "",
                "name"=> "type_tert",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "255"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "zs"=> [
                "description"=> "",
                "name"=> "zs",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "255"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ]
        ],
        "name"=> "partners",
        "description"=> "",
        "comment"=> "",
        "type"=> "table",
        "keyFld"=> "id",
        "relations"=> [
            "documents"=> [
                "table"=> "documents",
                "field"=> "partners_id",
                "type"=> "inbound"
            ],
            "orders"=> [
                "table"=> "orders",
                "field"=> "partner_id",
                "type"=> "inbound"
            ]
        ]
    ],
    "rights"=> [
        "fields"=> [
            "acces_type"=> [
                "description"=> "",
                "name"=> "acces_type",
                "comment"=> "",
                "type"=> [
                    "proto"=> "enum",
                    "vals"=> [
                        "create",
                        "read",
                        "update",
                        "delete"
                    ]
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null
            ],
            "id"=> [
                "description"=> "",
                "name"=> "id",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> true,
                "required"=> false,
                "default"=> null
            ],
            "resource"=> [
                "description"=> "",
                "name"=> "resource",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "200"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null
            ]
        ],
        "name"=> "rights",
        "description"=> "",
        "comment"=> "",
        "type"=> "table",
        "keyFld"=> "id"
    ],
    "settings_document_numbers"=> [
        "fields"=> [
            "id"=> [
                "description"=> "",
                "name"=> "id",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> true,
                "required"=> false,
                "default"=> null
            ],
            "label"=> [
                "description"=> "",
                "name"=> "label",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "45"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "lastissued"=> [
                "description"=> "",
                "name"=> "lastissued",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "maxval"=> [
                "description"=> "",
                "name"=> "maxval",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "series"=> [
                "description"=> "",
                "name"=> "series",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "45"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "type"=> [
                "description"=> "",
                "name"=> "type",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "50"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null,
                "foreignKey"=> [
                    "table"=> "settings_document_types",
                    "field"=> "type"
                ]
            ],
            "validfrom"=> [
                "description"=> "",
                "name"=> "validfrom",
                "comment"=> "",
                "type"=> [
                    "proto"=> "datetime"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "validto"=> [
                "description"=> "",
                "name"=> "validto",
                "comment"=> "",
                "type"=> [
                    "proto"=> "datetime"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ]
        ],
        "name"=> "settings_document_numbers",
        "description"=> "",
        "comment"=> "",
        "type"=> "table",
        "keyFld"=> "id",
        "relations"=> [
            "type"=> [
                "table"=> "settings_document_types",
                "field"=> "type",
                "type"=> "outbound",
                "fkfield"=> "type"
            ]
        ]
    ],
    "settings_document_types"=> [
        "fields"=> [
            "description"=> [
                "description"=> "",
                "name"=> "description",
                "comment"=> "",
                "type"=> [
                    "proto"=> "text"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "type"=> [
                "description"=> "",
                "name"=> "type",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "50"
                ],
                "iskey"=> true,
                "required"=> true,
                "default"=> null,
                "referencedBy"=> [
                    [
                        "table"=> "documents",
                        "field"=> "type"
                    ],
                    [
                        "table"=> "settings_document_numbers",
                        "field"=> "type"
                    ]
                ]
            ]
        ],
        "name"=> "settings_document_types",
        "description"=> "",
        "comment"=> "",
        "type"=> "table",
        "keyFld"=> "type",
        "relations"=> [
            "documents"=> [
                "table"=> "documents",
                "field"=> "type",
                "type"=> "inbound"
            ],
            "settings_document_numbers"=> [
                "table"=> "settings_document_numbers",
                "field"=> "type",
                "type"=> "inbound"
            ]
        ]
    ],
    "started_work"=> [
        "fields"=> [
            "card"=> [
                "description"=> "",
                "name"=> "card",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "30"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "currency"=> [
                "description"=> "",
                "name"=> "currency",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "10"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null
            ],
            "employee"=> [
                "description"=> "",
                "name"=> "employee",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null
            ],
            "hourly_rate"=> [
                "description"=> "",
                "name"=> "hourly_rate",
                "comment"=> "",
                "type"=> [
                    "proto"=> "float",
                    "length"=> "10,2"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "id"=> [
                "description"=> "",
                "name"=> "id",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> true,
                "required"=> true,
                "default"=> "0"
            ],
            "operation"=> [
                "description"=> "",
                "name"=> "operation",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null
            ],
            "operation_name"=> [
                "description"=> "",
                "name"=> "operation_name",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "50"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "order"=> [
                "description"=> "",
                "name"=> "order",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null
            ],
            "order_label"=> [
                "description"=> "",
                "name"=> "order_label",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "45"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "start"=> [
                "description"=> "",
                "name"=> "start",
                "comment"=> "",
                "type"=> [
                    "proto"=> "datetime"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> "CURRENT_TIMESTAMP"
            ],
            "stop"=> [
                "description"=> "",
                "name"=> "stop",
                "comment"=> "",
                "type"=> [
                    "proto"=> "datetime"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "worktime"=> [
                "description"=> "",
                "name"=> "worktime",
                "comment"=> "",
                "type"=> [
                    "proto"=> "time"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ]
        ],
        "relations"=> [],
        "description"=> "",
        "comment"=> "",
        "type"=> "view",
        "keyFld"=> "id"
    ],
    "stocks"=> [
        "fields"=> [
            "id"=> [
                "description"=> "",
                "name"=> "id",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> true,
                "required"=> true,
                "default"=> null,
                "referencedBy"=> [
                    [
                        "table"=> "catalog",
                        "field"=> "default_stock"
                    ],
                    [
                        "table"=> "stocks_content",
                        "field"=> "stocks_id"
                    ],
                    [
                        "table"=> "stocks_initial",
                        "field"=> "stocks_id"
                    ],
                    [
                        "table"=> "stocks_registry",
                        "field"=> "stocks_id"
                    ]
                ]
            ],
            "label"=> [
                "description"=> "",
                "name"=> "label",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "45"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "location"=> [
                "description"=> "",
                "name"=> "location",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "45"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "type"=> [
                "description"=> "",
                "name"=> "type",
                "comment"=> "",
                "type"=> [
                    "proto"=> "enum",
                    "vals"=> [
                        "mat",
                        "marf"
                    ]
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ]
        ],
        "name"=> "stocks",
        "description"=> "",
        "comment"=> "",
        "type"=> "table",
        "keyFld"=> "id",
        "relations"=> [
            "catalog"=> [
                "table"=> "catalog",
                "field"=> "default_stock",
                "type"=> "inbound"
            ],
            "stocks_content"=> [
                "table"=> "stocks_content",
                "field"=> "stocks_id",
                "type"=> "inbound"
            ],
            "stocks_initial"=> [
                "table"=> "stocks_initial",
                "field"=> "stocks_id",
                "type"=> "inbound"
            ],
            "stocks_registry"=> [
                "table"=> "stocks_registry",
                "field"=> "stocks_id",
                "type"=> "inbound"
            ]
        ]
    ],
    "stocks_content"=> [
        "fields"=> [
            "catalog_id"=> [
                "description"=> "",
                "name"=> "catalog_id",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null,
                "foreignKey"=> [
                    "table"=> "catalog",
                    "field"=> "catid"
                ]
            ],
            "id"=> [
                "description"=> "",
                "name"=> "id",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> true,
                "required"=> true,
                "default"=> null
            ],
            "qty"=> [
                "description"=> "",
                "name"=> "qty",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "45"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "stocks_id"=> [
                "description"=> "",
                "name"=> "stocks_id",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null,
                "foreignKey"=> [
                    "table"=> "stocks",
                    "field"=> "id"
                ]
            ],
            "value"=> [
                "description"=> "",
                "name"=> "value",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "45"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ]
        ],
        "name"=> "stocks_content",
        "description"=> "",
        "comment"=> "",
        "type"=> "table",
        "keyFld"=> "id",
        "relations"=> [
            "catalog_id"=> [
                "table"=> "catalog",
                "field"=> "catid",
                "type"=> "outbound",
                "fkfield"=> "catalog_id"
            ],
            "stocks_id"=> [
                "table"=> "stocks",
                "field"=> "id",
                "type"=> "outbound",
                "fkfield"=> "stocks_id"
            ]
        ]
    ],
    "stocks_initial"=> [
        "fields"=> [
            "catalog_catid"=> [
                "description"=> "",
                "name"=> "catalog_catid",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null,
                "foreignKey"=> [
                    "table"=> "catalog",
                    "field"=> "catid"
                ]
            ],
            "currency"=> [
                "description"=> "",
                "name"=> "currency",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "10"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null,
                "foreignKey"=> [
                    "table"=> "currencies",
                    "field"=> "id"
                ]
            ],
            "id"=> [
                "description"=> "",
                "name"=> "id",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> true,
                "required"=> true,
                "default"=> null
            ],
            "qty"=> [
                "description"=> "",
                "name"=> "qty",
                "comment"=> "",
                "type"=> [
                    "proto"=> "float",
                    "length"=> "10,3"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null
            ],
            "stocks_id"=> [
                "description"=> "",
                "name"=> "stocks_id",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null,
                "foreignKey"=> [
                    "table"=> "stocks",
                    "field"=> "id"
                ]
            ],
            "ts"=> [
                "description"=> "",
                "name"=> "ts",
                "comment"=> "",
                "type"=> [
                    "proto"=> "datetime"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null
            ],
            "value"=> [
                "description"=> "",
                "name"=> "value",
                "comment"=> "",
                "type"=> [
                    "proto"=> "float",
                    "length"=> "10,2"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null
            ]
        ],
        "name"=> "stocks_initial",
        "description"=> "",
        "comment"=> "",
        "type"=> "table",
        "keyFld"=> "id",
        "relations"=> [
            "stocks_id"=> [
                "table"=> "stocks",
                "field"=> "id",
                "type"=> "outbound",
                "fkfield"=> "stocks_id"
            ],
            "catalog_catid"=> [
                "table"=> "catalog",
                "field"=> "catid",
                "type"=> "outbound",
                "fkfield"=> "catalog_catid"
            ],
            "currency"=> [
                "table"=> "currencies",
                "field"=> "id",
                "type"=> "outbound",
                "fkfield"=> "currency"
            ]
        ]
    ],
    "stocks_registry"=> [
        "fields"=> [
            "catalog_id"=> [
                "description"=> "",
                "name"=> "catalog_id",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null,
                "foreignKey"=> [
                    "table"=> "catalog",
                    "field"=> "catid"
                ]
            ],
            "documents_docid"=> [
                "description"=> "",
                "name"=> "documents_docid",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null,
                "foreignKey"=> [
                    "table"=> "documents",
                    "field"=> "id"
                ]
            ],
            "id"=> [
                "description"=> "",
                "name"=> "id",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> true,
                "required"=> true,
                "default"=> null
            ],
            "oiid"=> [
                "description"=> "",
                "name"=> "oiid",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null,
                "foreignKey"=> [
                    "table"=> "orders_parts",
                    "field"=> "id"
                ]
            ],
            "stocks_id"=> [
                "description"=> "",
                "name"=> "stocks_id",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null,
                "foreignKey"=> [
                    "table"=> "stocks",
                    "field"=> "id"
                ]
            ],
            "ts"=> [
                "description"=> "",
                "name"=> "ts",
                "comment"=> "",
                "type"=> [
                    "proto"=> "datetime"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "type"=> [
                "description"=> "",
                "name"=> "type",
                "comment"=> "",
                "type"=> [
                    "proto"=> "enum",
                    "vals"=> [
                        "receptie",
                        "consum",
                        "vanzare",
                        "transfer",
                        "conversie"
                    ]
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ]
        ],
        "name"=> "stocks_registry",
        "description"=> "",
        "comment"=> "",
        "type"=> "table",
        "keyFld"=> "id",
        "relations"=> [
            "catalog_id"=> [
                "table"=> "catalog",
                "field"=> "catid",
                "type"=> "outbound",
                "fkfield"=> "catalog_id"
            ],
            "stocks_id"=> [
                "table"=> "stocks",
                "field"=> "id",
                "type"=> "outbound",
                "fkfield"=> "stocks_id"
            ],
            "documents_docid"=> [
                "table"=> "documents",
                "field"=> "id",
                "type"=> "outbound",
                "fkfield"=> "documents_docid"
            ],
            "oiid"=> [
                "table"=> "orders_parts",
                "field"=> "id",
                "type"=> "outbound",
                "fkfield"=> "oiid"
            ]
        ]
    ],
    "tags"=> [
        "fields"=> [
            "card"=> [
                "description"=> "",
                "name"=> "card",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "30"
                ],
                "iskey"=> true,
                "required"=> false,
                "default"=> null
            ],
            "emplid"=> [
                "description"=> "",
                "name"=> "emplid",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> "0",
                "foreignKey"=> [
                    "table"=> "employees",
                    "field"=> "id"
                ]
            ],
            "fname"=> [
                "description"=> "",
                "name"=> "fname",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "45"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null
            ],
            "lname"=> [
                "description"=> "",
                "name"=> "lname",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "45"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null
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
        "description"=> "",
        "comment"=> "",
        "type"=> "view",
        "keyFld"=> "card"
    ],
    "teams"=> [
        "fields"=> [
            "name"=> [
                "description"=> "",
                "name"=> "name",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "45"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null
            ],
            "teamlead"=> [
                "description"=> "",
                "name"=> "teamlead",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null,
                "foreignKey"=> [
                    "table"=> "employees",
                    "field"=> "id"
                ]
            ],
            "tid"=> [
                "description"=> "",
                "name"=> "tid",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> true,
                "required"=> false,
                "default"=> null,
                "referencedBy"=> [
                    [
                        "table"=> "employees",
                        "field"=> "team"
                    ]
                ]
            ]
        ],
        "name"=> "teams",
        "description"=> "",
        "comment"=> "",
        "type"=> "table",
        "keyFld"=> "tid",
        "relations"=> [
            "teamlead"=> [
                "table"=> "employees",
                "field"=> "id",
                "type"=> "outbound",
                "fkfield"=> "teamlead"
            ],
            "employees"=> [
                "table"=> "employees",
                "field"=> "team",
                "type"=> "inbound"
            ]
        ]
    ],
    "timetracking"=> [
        "fields"=> [
            "currency"=> [
                "description"=> "",
                "name"=> "currency",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "10"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null,
                "foreignKey"=> [
                    "table"=> "currencies",
                    "field"=> "id"
                ]
            ],
            "employee"=> [
                "description"=> "",
                "name"=> "employee",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null,
                "foreignKey"=> [
                    "table"=> "employees",
                    "field"=> "id"
                ]
            ],
            "hourly_rate"=> [
                "description"=> "",
                "name"=> "hourly_rate",
                "comment"=> "",
                "type"=> [
                    "proto"=> "float",
                    "length"=> "10,2"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "id"=> [
                "description"=> "",
                "name"=> "id",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> true,
                "required"=> false,
                "default"=> null
            ],
            "operation"=> [
                "description"=> "",
                "name"=> "operation",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null,
                "foreignKey"=> [
                    "table"=> "operations",
                    "field"=> "id"
                ]
            ],
            "order"=> [
                "description"=> "",
                "name"=> "order",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null,
                "foreignKey"=> [
                    "table"=> "orders",
                    "field"=> "oid"
                ]
            ],
            "start"=> [
                "description"=> "",
                "name"=> "start",
                "comment"=> "",
                "type"=> [
                    "proto"=> "datetime"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> "CURRENT_TIMESTAMP"
            ],
            "status"=> [
                "description"=> "",
                "name"=> "status",
                "comment"=> "",
                "type"=> [
                    "proto"=> "enum",
                    "vals"=> [
                        "w",
                        "f"
                    ]
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> "w"
            ],
            "stop"=> [
                "description"=> "",
                "name"=> "stop",
                "comment"=> "",
                "type"=> [
                    "proto"=> "datetime"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ]
        ],
        "name"=> "timetracking",
        "description"=> "",
        "comment"=> "",
        "type"=> "table",
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
    ],
    "tt_expanded"=> [
        "fields"=> [
            "currency"=> [
                "description"=> "",
                "name"=> "currency",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "10"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null
            ],
            "docnum"=> [
                "description"=> "",
                "name"=> "docnum",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "45"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "duration"=> [
                "description"=> "",
                "name"=> "duration",
                "comment"=> "",
                "type"=> [
                    "proto"=> "time"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "empl_name"=> [
                "description"=> "",
                "name"=> "empl_name",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "91"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "employee"=> [
                "description"=> "",
                "name"=> "employee",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null
            ],
            "hourly_rate"=> [
                "description"=> "",
                "name"=> "hourly_rate",
                "comment"=> "",
                "type"=> [
                    "proto"=> "float",
                    "length"=> "10,2"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "id"=> [
                "description"=> "",
                "name"=> "id",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> true,
                "required"=> true,
                "default"=> "0"
            ],
            "op_name"=> [
                "description"=> "",
                "name"=> "op_name",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "50"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "operation"=> [
                "description"=> "",
                "name"=> "operation",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null
            ],
            "order"=> [
                "description"=> "",
                "name"=> "order",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null
            ],
            "start"=> [
                "description"=> "",
                "name"=> "start",
                "comment"=> "",
                "type"=> [
                    "proto"=> "datetime"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> "CURRENT_TIMESTAMP"
            ],
            "status"=> [
                "description"=> "",
                "name"=> "status",
                "comment"=> "",
                "type"=> [
                    "proto"=> "enum",
                    "vals"=> [
                        "w",
                        "f"
                    ]
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> "w"
            ],
            "stop"=> [
                "description"=> "",
                "name"=> "stop",
                "comment"=> "",
                "type"=> [
                    "proto"=> "datetime"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ]
        ],
        "relations"=> [],
        "description"=> "",
        "comment"=> "",
        "type"=> "view",
        "keyFld"=> "id"
    ],
    "units"=> [
        "fields"=> [
            "type"=> [
                "description"=> "",
                "name"=> "type",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "45"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "unit"=> [
                "description"=> "",
                "name"=> "unit",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "45"
                ],
                "iskey"=> true,
                "required"=> true,
                "default"=> null,
                "referencedBy"=> [
                    [
                        "table"=> "catalog",
                        "field"=> "units_unit"
                    ]
                ]
            ]
        ],
        "name"=> "units",
        "description"=> "",
        "comment"=> "",
        "type"=> "table",
        "keyFld"=> "unit",
        "relations"=> [
            "catalog"=> [
                "table"=> "catalog",
                "field"=> "units_unit",
                "type"=> "inbound"
            ]
        ]
    ],
    "usergroups"=> [
        "fields"=> [
            "description"=> [
                "description"=> "",
                "name"=> "description",
                "comment"=> "",
                "type"=> [
                    "proto"=> "text"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "groupid"=> [
                "description"=> "",
                "name"=> "groupid",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "50"
                ],
                "iskey"=> true,
                "required"=> false,
                "default"=> null
            ],
            "userid"=> [
                "description"=> "",
                "name"=> "userid",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "20"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null
            ]
        ],
        "relations"=> [],
        "description"=> "",
        "comment"=> "",
        "type"=> "view",
        "keyFld"=> "groupid"
    ],
    "users"=> [
        "fields"=> [
            "active"=> [
                "description"=> "",
                "name"=> "active",
                "comment"=> "",
                "type"=> [
                    "proto"=> "tinyint"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> "1"
            ],
            "creationtime"=> [
                "description"=> "",
                "name"=> "creationtime",
                "comment"=> "",
                "type"=> [
                    "proto"=> "datetime"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> "CURRENT_TIMESTAMP"
            ],
            "email"=> [
                "description"=> "",
                "name"=> "email",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "45"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "fname"=> [
                "description"=> "",
                "name"=> "fname",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "45"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "lastlogin"=> [
                "description"=> "",
                "name"=> "lastlogin",
                "comment"=> "",
                "type"=> [
                    "proto"=> "datetime"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "lname"=> [
                "description"=> "",
                "name"=> "lname",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "45"
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "password"=> [
                "description"=> "",
                "name"=> "password",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "255"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null
            ],
            "type"=> [
                "description"=> "",
                "name"=> "type",
                "comment"=> "",
                "type"=> [
                    "proto"=> "enum",
                    "vals"=> [
                        "sys",
                        "empl",
                        "adm"
                    ]
                ],
                "iskey"=> false,
                "required"=> false,
                "default"=> null
            ],
            "userid"=> [
                "description"=> "",
                "name"=> "userid",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "20"
                ],
                "iskey"=> true,
                "required"=> true,
                "default"=> null,
                "referencedBy"=> [
                    [
                        "table"=> "usergroups",
                        "field"=> "userid"
                    ],
                    [
                        "table"=> "employees",
                        "field"=> "userid"
                    ],
                    [
                        "table"=> "maintenance",
                        "field"=> "execby"
                    ],
                    [
                        "table"=> "orders",
                        "field"=> "created_by"
                    ],
                    [
                        "table"=> "users_2_groups",
                        "field"=> "userid"
                    ],
                    [
                        "table"=> "users_rights",
                        "field"=> "users_userid"
                    ]
                ]
            ]
        ],
        "name"=> "users",
        "description"=> "",
        "comment"=> "",
        "type"=> "table",
        "keyFld"=> "userid",
        "relations"=> [
            "documents"=> [
                "table"=> "documents",
                "field"=> "userid",
                "type"=> "inbound"
            ],
            "employees"=> [
                "table"=> "employees",
                "field"=> "userid",
                "type"=> "inbound"
            ],
            "maintenance"=> [
                "table"=> "maintenance",
                "field"=> "execby",
                "type"=> "inbound"
            ],
            "orders"=> [
                "table"=> "orders",
                "field"=> "created_by",
                "type"=> "inbound"
            ],
            "users_2_groups"=> [
                "table"=> "users_2_groups",
                "field"=> "userid",
                "type"=> "inbound"
            ],
            "users_rights"=> [
                "table"=> "users_rights",
                "field"=> "users_userid",
                "type"=> "inbound"
            ],
            "groups"=> [
                "table"=> "usergroups",
                "field"=> "userid",
                "type"=> "inbound"
            ]
        ]
    ],
    "users_2_groups"=> [
        "fields"=> [
            "groupid"=> [
                "description"=> "",
                "name"=> "groupid",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "20"
                ],
                "iskey"=> true,
                "required"=> true,
                "default"=> null,
                "foreignKey"=> [
                    "table"=> "groups",
                    "field"=> "groupid"
                ]
            ],
            "userid"=> [
                "description"=> "",
                "name"=> "userid",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "20"
                ],
                "iskey"=> true,
                "required"=> true,
                "default"=> null,
                "foreignKey"=> [
                    "table"=> "users",
                    "field"=> "userid"
                ]
            ]
        ],
        "name"=> "users_2_groups",
        "description"=> "",
        "comment"=> "",
        "type"=> "table",
        "keyFld"=> "userid",
        "relations"=> [
            "groupid"=> [
                "table"=> "groups",
                "field"=> "groupid",
                "type"=> "outbound",
                "fkfield"=> "groupid"
            ],
            "userid"=> [
                "table"=> "users",
                "field"=> "userid",
                "type"=> "outbound",
                "fkfield"=> "userid"
            ]
        ]
    ],
    "users_rights"=> [
        "fields"=> [
            "access_rights_name"=> [
                "description"=> "",
                "name"=> "access_rights_name",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "40"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null,
                "foreignKey"=> [
                    "table"=> "access_rights",
                    "field"=> "name"
                ]
            ],
            "id"=> [
                "description"=> "",
                "name"=> "id",
                "comment"=> "",
                "type"=> [
                    "proto"=> "int"
                ],
                "iskey"=> true,
                "required"=> false,
                "default"=> null
            ],
            "users_userid"=> [
                "description"=> "",
                "name"=> "users_userid",
                "comment"=> "",
                "type"=> [
                    "proto"=> "varchar",
                    "length"=> "20"
                ],
                "iskey"=> false,
                "required"=> true,
                "default"=> null,
                "foreignKey"=> [
                    "table"=> "users",
                    "field"=> "userid"
                ]
            ]
        ],
        "name"=> "users_rights",
        "description"=> "",
        "comment"=> "",
        "type"=> "table",
        "keyFld"=> "id",
        "relations"=> [
            "access_rights_name"=> [
                "table"=> "access_rights",
                "field"=> "name",
                "type"=> "outbound",
                "fkfield"=> "access_rights_name"
            ],
            "users_userid"=> [
                "table"=> "users",
                "field"=> "userid",
                "type"=> "outbound",
                "fkfield"=> "users_userid"
            ]
        ]
    ],
    "emplToOrdAssoc"=> [
        "fields"=> [
            "id"=> [
                "iskey"=> true
            ]
        ],
        "keyFld"=> "id"
    ]
];