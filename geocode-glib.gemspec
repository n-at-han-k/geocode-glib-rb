# frozen_string_literal: true

# Released under the Apache License, Version 2.0.
# Copyright, 2026, by General Intelligence Systems.

require_relative "lib/geocode_glib/version"

Gem::Specification.new do |spec|
  spec.name = "geocode-glib"
  spec.version = GeocodeGlib::VERSION
  spec.authors = ["Nathan Kidd"]
  spec.email = ["nathankidd@hey.com"]
  spec.license = "Apache-2.0"

  spec.summary = "Ruby bindings for geocode-glib, forward and reverse geocoding over Nominatim."
  spec.description = "Geocode-glib, forward and reverse geocoding over Nominatim, for Ruby. Defined from its GObject "\
    "Introspection typelib at require time rather than wrapped by hand, so the "\
    "binding is the whole namespace and does not drift as the library gains API."
  spec.homepage = "https://github.com/n-at-han-k/geocode-glib-rb"

  spec.required_ruby_version = ">= 3.3"

  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["documentation_uri"] = "https://n-at-han-k.github.io/geocode-glib-rb/"

  # The library, and the native extension's sources.
  #
  spec.files = Dir.glob(
    ["{lib}/**/*", "LICENSE", "NOTICE", "README.md", "CHANGELOG.md"],
    File::FNM_DOTMATCH,
    base: __dir__,
  )

  spec.require_paths = ["lib"]

  # GemKit::Deprecate declares a deprecation as a dated promise: the replacement, and the version the old name stops existing in.
  spec.add_dependency "gem_kit", "~> 0.2"

  # The loader. This is the whole binding: GObjectIntrospection::Loader reads
  # geocode-glib_2's typelib and defines the GeocodeGlib namespace from it. glib2 comes along
  # as its dependency and is what GLib::Log and the GObject base classes are.
  #
  # geocode-glib_2 itself is NOT a gem dependency and cannot be: it is a C library and
  # its typelib belongs to the distribution. See the README for the package name.
  spec.add_dependency "gobject-introspection", "~> 4.3"


  spec.add_development_dependency "lefthook", "~> 2.2"
end
