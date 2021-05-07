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
    ]
];