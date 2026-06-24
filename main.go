package main

import (
	"crypto/sha256"
	"fmt"
	"time"
)

// GenerateBunnyToken creates a signed token for Bunny Stream embed authentication
// Based on: https://docs.bunny.net/stream/token-authentication
//
// Parameters:
//   securityKey  - Token Security Key from your Bunny Stream library settings
//   videoID      - The video GUID (e.g. "eb1c4f77-0cda-46be-b47d-1118ad7c2ffe")
//   libraryID    - Your Bunny Stream library ID (e.g. "759")
//   expiresIn    - How long the token is valid (e.g. 2 * time.Hour)

func GenerateBunnyToken(securityKey, videoID string, expiration int64) string {
	// Algorithm: SHA256_HEX(securityKey + videoID + expiration)
	raw := fmt.Sprintf("%s%s%d", securityKey, videoID, expiration)
	hash := sha256.Sum256([]byte(raw))
	return fmt.Sprintf("%x", hash)
}

func GenerateEmbedURL(videoID, securityKey string, expiresIn time.Duration) string {
	// Calculate expiration as Unix timestamp
	expiration := time.Now().Add(expiresIn).Unix()

	// Generate token
	token := GenerateBunnyToken(securityKey, videoID, expiration)

	// Build the signed embed URL
	return fmt.Sprintf(
		"https://player.mediadelivery.net/play/689912/9080cf5e-f778-4b22-89b7-80d44b686dc4?token=%s&expires=%d",
		// libraryID,
		// videoID,
		token,
		expiration,
	)
}

// https://iframe.mediadelivery.net/embed/689912/9080cf5e-f778-4b22-89b7-80d44b686dc4?token=%s&expires=%d
// https://player.mediadelivery.net/play/689912/9080cf5e-f778-4b22-89b7-80d44b686dc4?token=%s&expires=%d
// https://vz-ec08e264-086.b-cdn.net/9080cf5e-f778-4b22-89b7-80d44b686dc4/playlist.m3u8

func main() {
	// --- Replace these with your actual values ---
	securityKey := "9b53ec7f-ddd0-4668-86f6-9fd8ccbacdee" // Bunny Stream Library → Security → Token Auth Key
	// libraryID   := "689912"                      // Your Stream Library ID 
	videoID     := "9080cf5e-f778-4b22-89b7-80d44b686dc4" // Your video GUID

	// Generate a URL valid for 2 hours
	url := GenerateEmbedURL(videoID, securityKey, 1*time.Hour)

	fmt.Println("Signed embed URL:")
	fmt.Println(url)
}