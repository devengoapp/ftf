# Complementary 
# FTF_B88353412_202501_001.txt

{
  "fiscal_id": "B88353412",
  "period": "202501",
  "request_id": "",
  "file_type": "C",
  "products": [
    # Data register 10 (product) DELETE (its holders and relationships are automatically deleted)
    {
      "action": "X",
      "type": "01",
      "id_type": "01",
      "id": "ES8931906516575376987825",
      "created_at": "20250101",
      "canceled_at": "20250305"
    },
    # Data register 10 (product) DELETE RELATIONSHIP between product and holder
    {
      "action": "M",
      "type": "01",
      "id_type": "01",
      "id": "ES8931906516575376987825",
      "created_at": "20250101",
      "holders": [
        {
          "action": "M",
          "name": "Aitor Garcia Rey",
          "id_type": "01",
          "id": "22754545R", 
          "country": "ES",
          "created_at": "19790513",
          # Data register 30 (relationship product-holder) DELETE
          "relationships": [
            {
              "action": "X",
              "type": "TIT",
              "created_at": "20250101",
              "canceled_at": "20250305"
            }
          ]
        }
      ]
    },
    # Data register 10 (product) DELETE IBAN
    {
      "action": "M",
      "type": "01",
      "id_type": "01",
      "id": "ES8931906516575376987825",
      "created_at": "20250101",
      "ibans": [
        # Data register 11 - Delete the number of a product
        {
          "action": "X",
          "type": "01",
          "id": "ES8931906516575376987800" # Number to DELETE from product
        },
      ]
    },
  ],
  "holders": [
    # Any person remaining in the FTF not associated with any product will be automatically deleted.
  ]
}
