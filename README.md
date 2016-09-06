# SeqK-means_Princeton

##Summary

This project aims to explore the language of different bodies in the field of dance by analyzing
the habitual patterns of dancers from different backgrounds and vernaculars. Contextually,
the term habitual patterns is defined as the postures or poses that tend to re-appear,
often unintentionally, as the dancer performs improvisational dance. The focus lies in exposing
the movement vocabulary of a dancer to reveal his/her unique fingerprint.
The proposed approach for uncovering these movement patterns is to use a clustering
technique; mainly k-means. In addition to a static method of analysis, it uses
an online method of clustering using a streaming variant of k-means that integrates into
the flow of components that can be used in a real-time interactive dance performance. The
computational system is trained by the dancer to discover identifying patterns and therefore
it enables a feedback loop resulting in a rich exchange between dancer and machine. This
can help break a dancer’s tendency to create similar postures, explore larger kinespheric
space and invent movement beyond their current capabilities.
This project distinguishes itself in that it uses a custom database
that is curated for the purpose of highlighting the similarities and differences between various
movement forms. It puts particular emphasis on the process of choosing source movement
qualitatively, before the technological capture process begins.

For details on the following technical aspects, please read Chapter 3 : 

https://repository.asu.edu/attachments/170653/content/Iyengar_asu_0010N_15999.pdf

## Procedure

Programming Steps:
The algorithm is adapted from a version of Sequential K-means : 

http://www.cs.princeton.edu/courses/archive/fall08/cos436/Duda/C/sk_means.htm

- Make initial guesses for the means m1, m2, ..., mk
- Set the counts n1, n2, ..., nk to zero
- Until interrupted
  - Acquire the next example, x
  - If mi is closest to x
      - Increment ni
  - Replace mi by mi + (1/ni)*( x - mi)
    - end_if
- end_until

## How to run the Matlab Code

- Code consists of 2 functions and the relevant helper files and data

1. readlingline_trail
      Reads CSV data sequentially and writes to a buffer text file. 
      
2. seq_kmeans_princeton
      Computes the biggest 4 cluster centers according to the algorithm explained above.
      The data points are read in blocks from the CSV file. With each point coming in, the closest mean is found. The data-point closest to the biggest cluster center is considered the "recurring pattern" of the movement.


3. Varsha_SpaceTake_New.csv
      Primary data file collected in the motion capture system.
4. oscsend
5. process_text_data
      The above files are for real-time streaming of data from teh motion capture system. Teh data is streamed using OSC and then cleaned. 
