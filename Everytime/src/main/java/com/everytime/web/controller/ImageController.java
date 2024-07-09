package com.everytime.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.File;
import java.io.IOException;

@RestController
@RequestMapping("/image")
public class ImageController {

	@Autowired
	private String uploadPath;

	@GetMapping("/{year}/{month}/{day}/{profileName}.{profileExtension}")
	public Resource getProfileImageToDirectory(@PathVariable String year, @PathVariable String month, @PathVariable String day,
			@PathVariable String profileName, @PathVariable String profileExtension) throws IOException {

		File file = new File(uploadPath + File.separator + year + File.separator + month + File.separator + day
				+ File.separator + profileName + "." + profileExtension);
		return new FileSystemResource(file);
	}

	@GetMapping("/{profilePath}/{profileName}.{profileExtension}")
	public Resource getProfileOriginImageToDirectory(@PathVariable String profilePath, @PathVariable String profileName,
			@PathVariable String profileExtension) throws IOException {

		File file = new File(
				uploadPath + File.separator + profilePath + File.separator + profileName + "." + profileExtension);
		return new FileSystemResource(file);
	}
}
