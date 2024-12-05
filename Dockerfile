# Base image
FROM debian:latest

# Install vsftpd
RUN apt-get update && \
    apt-get install -y vsftpd && \
    apt-get clean

# Copy the vsftpd configuration file
COPY vsftpd.conf /etc/vsftpd.conf

# Create FTP user and set their password
RUN useradd -m -s /bin/bash ftpuser && \
    echo "ftpuser:password123" | chpasswd && \
    mkdir -p /home/ftpuser/ftp && \
    echo "CTF{This_is_your_flag}" > /home/ftpuser/ftp/flag.txt && \
    chmod 644 /home/ftpuser/ftp/flag.txt && \
    chown -R ftpuser:ftpuser /home/ftpuser/ftp &&\
	echo "ftpuser" > /etc/vsftpd.userlist && \
    chmod 644 /etc/vsftpd.userlist && \
	mkdir -p /var/run/vsftpd/empty && \
    chmod 755 /var/run/vsftpd/empty

# Expose the FTP port
EXPOSE 21 

# Start vsftpd
CMD ["vsftpd", "/etc/vsftpd.conf"]