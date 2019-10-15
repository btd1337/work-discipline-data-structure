project('trabalho_ed2', ['c', 'vala'],
        version: '0.1.0',
  meson_version: '>= 0.49.0',
)

executable(
	meson.project_name(),
	'src/main/vala/enums/FileTypes.vala',
	'src/main/vala/enums/QuicksortType.vala',
	'src/main/vala/models/DataStructures.vala',
	'src/main/vala/models/Review.vala',
	'src/main/vala/utils/Constraints.vala',
	'src/main/vala/utils/CSVHandler.vala',
	'src/main/vala/utils/GIO.vala',
	'src/main/vala/utils/Sorter.vala',
	'src/main/vala/utils/Statistic.vala',
	'src/main/vala/Main.vala',
	'src/main/vala/ReviewManager.vala',
	dependencies: [
		dependency('gee-0.8'),
		dependency('gio-2.0'),
		dependency('glib-2.0'),
	],
	install: false
)



