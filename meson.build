project('trabalho_ed2', ['c', 'vala'],
        version: '0.1.0',
  meson_version: '>= 0.49.0',
)

executable(
	meson.project_name(),
	'src/enums/FileTypes.vala',
	'src/models/Review.vala',
	'src/utils/CSVHandler.vala',
	'src/utils/Sorter.vala',
	'src/Main.vala',
	'src/ReviewManager.vala',
	dependencies: [
		dependency('glib-2.0'),
		dependency('gio-2.0'),
		dependency('readline')
	],
	install: false
)



