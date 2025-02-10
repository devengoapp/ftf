# Ftf

- El procedimiento de envío de los ficheros se hará exclusivamente por vía de Editran
- Solo se enviará un fichero de texto con codificación de caracteres ISO8859-1.
- Se deben declarar las aperturas, cancelaciones y modificaciones de:
  - cuentas corrientes
  - cuentas de ahorro
  - depósitos
  - cualquier otro tipo de cuentas de pago
  - los contratos de alquiler de cajas de seguridad.
- El formato de los campos con datos seguirá las siguientes especificaciones:
  - Si su formato es numérico, deben alinearse a la derecha y completarse con ceros a la  izquierda hasta completar el tamaño del campo. No hay cifras decimales.
  - Si su formato es alfanumérico, y no se especifica lo contrario, deben alinearse a la  izquierda y completarse con espacios a la derecha hasta completar el tamaño del campo.
- Tipos de registro:
  - "00" - Registro de Cabecera
  - "10" - Registro de producto
    - Accion "A" para nuevo registro, "M" para modificar un producto existente y "X" para borrar un producto del FTF
  - "11" - Cambio numeración
    - Accion "A" para nueva numeración, "M" para modificar la numeración existente y "X" para borrar la numeración
  - "20" - Registro interviniente
    - Accion "A" para nuevo registro, "M" para modificar la relacion entre interviniente y producto
  - "21" - Registro de cambio en el nombre del interviniente
    - Accion "A" para nuevo indicar el nuevo nombre, "M" para corregir el nombre presentado y "X" para borrarlo.
  - "22" - Registro de cambio en el documento identificativo
    - Accion "A" para nuevo indicar el nuevo nombre, "M" para corregir el documento presentado y "X" para borrarlo.
  - "30" - Registro de tipo de intervención
    - Accion "A" para nuevo indicar el nuevo nombre, "M" para corregir el tipo y "X" para borrarlo.
  - "19" - Registro de Final de producto
    - Cierra el registro de tipo "10"
  - "99" - Registro de Final de fichero

- Fichero negativo: 1 record 00 + 1 record 99
- Fichero mensual:
  - 1 record 00
  - N records 10  // Bloque de producto
    - 0-N records 11
    - 0-N records 20
      - 1-N records 30
    - 1 record 19
  - N records 20 // Bloque de interviniente
    - 0-N records 21
    - 0-N records 22
  - 1 record 99
{
  "fiscal_id": "",
  "request_id": "",
  "type": "",
  "products": [

  ]
}


Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/ftf`. To experiment with that code, run `bin/console` for an interactive prompt.

## Installation

TODO: Replace `UPDATE_WITH_YOUR_GEM_NAME_IMMEDIATELY_AFTER_RELEASE_TO_RUBYGEMS_ORG` with your gem name right after releasing it to RubyGems.org. Please do not do it earlier due to security reasons. Alternatively, replace this section with instructions to install your gem from git if you don't plan to release to RubyGems.org.

Install the gem and add to the application's Gemfile by executing:

```bash
bundle add UPDATE_WITH_YOUR_GEM_NAME_IMMEDIATELY_AFTER_RELEASE_TO_RUBYGEMS_ORG
```

If bundler is not being used to manage dependencies, install the gem by executing:

```bash
gem install UPDATE_WITH_YOUR_GEM_NAME_IMMEDIATELY_AFTER_RELEASE_TO_RUBYGEMS_ORG
```

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/aitor/ftf. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/aitor/ftf/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Ftf project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/aitor/ftf/blob/main/CODE_OF_CONDUCT.md).
