project('trabalho_ed2', ['c', 'vala'],
        version: '0.1.0',
  meson_version: '>= 0.49.0',
)

executable(
	meson.project_name(),
	'src/main/vala/enums/FileTypes.vala',
	'src/main/vala/models/Review.vala',
	'src/main/vala/utils/CSVHandler.vala',
	'src/main/vala/utils/Sorter.vala',
	'src/main/vala/Main.vala',
	'src/main/vala/ReviewManager.vala',
	dependencies: [
		dependency('glib-2.0'),
		dependency('gio-2.0'),
		dependency('readline')
	],
	install: false
)



