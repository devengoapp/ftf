# Mensual 
# FTF_B88353412_202501_001.txt

{
  "fiscal_id": "B88353412",
  "period": "202501",
  "request_id": "",
  "file_type": "M",
  "products": [
    # Data register 10 (product) ADD
    {
      "action": "A",
      "type": "01", # cuenta corriente
      "id_type": "01", # iban
      "id": "ES8931906516575376987825",
      "created_at": "20250101",
      # Data register 20 (holder) ADD
      "holders": [
        {
          "action": "A",
          "name": "Aitor Garcia Rey",
          "id_type": "01", # Type: NIF
          "id": "22754545R", 
          "country": "ES",
          "created_at": "19790513", # Birth date
          # Data register 30 (relationship product-holder) ADD
          "relationships": [
            {
              "action": "A",
              "type": "TIT",
              "created_at": "20250101"
            }
          ]
        }
      ]
    },
    # Data register 10 (product) MODIFY
    {
      # Modify a product
      "action": "M",
      "type": "01",
      "id_type": "01",
      "id": "ES8931906516575376987825",
      "created_at": "20250101",
      "ibans": [
        # Data register 11 - Changing the number of a product (type X only in complementary files)
        {
          "action": "A",
          "type": "01",
          "id": "ES8931906516575376987899" # New number ADDED to the previous one
        },
        {
          "action": "M",
          "type": "01",
          "id": "ES8931906516575376987800" # New number MODIFYING the previous one
        },
      ],
      "holders": [
        # ADD to product
        {
          "action": "A",
          "name": "Teresa Rexach Gonzalez",
          "id_type": "01",
          "id": "52898109H", 
          "country": "ES",
          "created_at": "19901101",
          # Data register 30 (relationship product-holder) ADD
          "relationship": {
            "action": "A",
            "type": "AUT",
            "created_at": "20250303"
          }
        },
        # MODIFY inside a product
        {
          "action": "M",
          "name": "Aitor Garcia Rey",
          "id_type": "01",
          "id": "22754545R", 
          "country": "ES",
          "created_at": "19790513",
          # Data register 30 (relationship product-holder) MODIFY
          "relationships": [
            {
              "action": "M",
              "type": "AUT", # New relationship
              "created_at": "20250301",
              "previous_type": "TIT" # Previous relationship
            }
          ]
        }
      ]
    }
  ],
  "holders": [
    # MODIFY holders data only (NO relationships)
    {
      "action": "M",
      "name": "Aitor Garcia Rey",
      "id_type": "01",
      "id": "22754545R", 
      "country": "ES",
      "created_at": "19790513",
      "names": [
        # Data register 21 - Changing / adding holder's name (type X only in complementary files)
        {
          "action": "A",
          "name": "Aitor Perez", # New name to ADD
        },
        {
          "action": "M",
          "name": "Alberto Molpeceres", # New name that MODIFY the previous one
        },
      ],
      "ids": [
        # Data register 22 - Changing / adding holder's identifier (type X only in complementary files)
        {
          "action": "A",
          "id_type": "02", # Passport
          "id": "ABC123456", # Passport ADDED to holder
          "country": "ES"
        },
        {
          "action": "M",
          "id_type": "01", # DNI
          "id": "12345678P", # New DNI (from NIE to DNI for example)
          "country": "ES"
        },
      ]
    }
  ]
}
