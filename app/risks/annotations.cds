using RiskService as service from '../../srv/risk-service';

// Risk List Report Page
annotate service.Risks with @(UI : {
    HeaderInfo      : {
        $Type          : 'UI.HeaderInfoType',
        TypeName       : 'Risk',
        TypeNamePlural : 'Risks',
        Title          : {
            $Type : 'UI.DataField',
            Value : title
        },
        Description    : {
            $Type : 'UI.DataField',
            Value : descr
        }
    },
    SelectionFields : [prio],
    Identification  : [{Value : title}],

    // Define the table columns
    LineItem        : [
        {Value : title},
        {Value : miti_ID},
        {Value : owner},
        {Value: bp_BusinessPartner},
        {
            Value       : prio,
            Criticality : criticality
        },
        {
            Value       : impact,
            Criticality : criticality
        }
    ],
});

// Risk Object Page
annotate service.Risks with @(UI : {
    Facets           : [{
        $Type  : 'UI.ReferenceFacet',
        Label  : 'Main',
        Target : '@UI.FieldGroup#Main'
    }],
    FieldGroup #Main : {
        $Type : 'UI.FieldGroupType',
        Data  : [
            {Value : miti_ID},
            {Value : owner},
            {Value: bp_BusinessPartner},
            {
                Value       : prio,
                Criticality : criticality
            },
            {
                Value       : impact,
                Criticality : criticality
            }
        ]
    },
});
