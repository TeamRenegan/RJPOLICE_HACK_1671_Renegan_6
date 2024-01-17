import cv2


def detect_cctv_fall(image1, image2, threshold=1000, edges_threshold=0.10, debug=False):
    # Convert to grayscale
    img1_gray = cv2.cvtColor(image1, cv2.COLOR_BGR2GRAY)
    img2_gray = cv2.cvtColor(image2, cv2.COLOR_BGR2GRAY)

    # Blur images
    img1_gaussian = cv2.GaussianBlur(img1_gray, (5, 5), 0)
    img2_gaussian = cv2.GaussianBlur(img2_gray, (5, 5), 0)

    # Detect edges
    img1_edges = cv2.Canny(img1_gaussian, 100, 300)
    img2_edges = cv2.Canny(img2_gaussian, 100, 300)

    # Calculate variation
    img1_edges_var = img1_edges.var()
    img2_edges_var = img2_edges.var()

    # Subtract images
    subtracted = cv2.subtract(img1_gaussian, img2_gaussian)

    # Calculate variation
    variation = subtracted.var()

    if debug:
        print("Variation: ", variation)
        print("Edges Variation: ", img1_edges_var, img2_edges_var)
        print("Edges Variation Difference: ", abs(img1_edges_var - img2_edges_var))

        while True:
            cv2.imshow("Image1", image1)
            cv2.imshow("Image2", image2)
            cv2.imshow("Edges1", img1_edges)
            cv2.imshow("Edges2", img2_edges)
            cv2.imshow("Gaussion1", img1_gaussian)
            cv2.imshow("Gaussion2", img2_gaussian)
            cv2.imshow("Subtracted", subtracted)

            if cv2.waitKey(1) == ord("q"):
                break

    if (
        # Variation is greater than threshold
        variation > threshold
        # Edges variation difference is greater than edges threshold
        or abs(img1_edges_var - img2_edges_var) / img1_edges_var > edges_threshold
    ):
        # Displacement detected
        return True
    else:
        return False
