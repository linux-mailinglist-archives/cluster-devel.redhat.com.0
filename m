Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 7756598586
	for <lists+cluster-devel@lfdr.de>; Wed, 21 Aug 2019 22:24:16 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D4BBC11A00;
	Wed, 21 Aug 2019 20:24:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C0D1B60603;
	Wed, 21 Aug 2019 20:24:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B57B92551B;
	Wed, 21 Aug 2019 20:24:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7LKO52c026331 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 21 Aug 2019 16:24:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3C31517D29; Wed, 21 Aug 2019 20:24:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx26.extmail.prod.ext.phx2.redhat.com
	[10.5.110.67])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 330FD5DC1E;
	Wed, 21 Aug 2019 20:24:02 +0000 (UTC)
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B22F98980EF;
	Wed, 21 Aug 2019 20:24:01 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id z3so7363605iog.0;
	Wed, 21 Aug 2019 13:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Cb34hvSHfTOaxOpUGV4SIJr+N2dm/IYSUfB2jrXQVXg=;
	b=R7AmGmauC3ectTYZH11YkKXxlEkDtgSRea7ivjqEU1sjriQpEoNC+8g6e3NCp5kGYO
	QtBhN7MdDCQ+bhuJCDFOMMp4p7c0CQbv2qZLZtL2QqXuWTneCL7c+CWygf1rNz4EfJRD
	9yb/CmoLpOfIkhTZSBvpRuA3CYTTwtQmlaK+Ha8C4DQYv7/+vrWOP+ftOvYNPQf3zJzC
	QUMDEHdKDgwYzoH0mTWZLq11NVJeMJGPMOzsVsczBb/OA+goqcRT3EUXgC1qj2bJUcBZ
	A/i6ZSVBuUTBrZFnTJaAyLgP1tKsNFitYSdPZRZ4wku4xkm3gviLH6xKknkMhq7L8BX1
	9Q8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Cb34hvSHfTOaxOpUGV4SIJr+N2dm/IYSUfB2jrXQVXg=;
	b=nFtlRuMjuVGcRwi9a3Lnb5//el+DLpno7ujEiogLchwH4eIaq4oVNbwhDRAcV324iS
	o/HhUDLsD2/jWrJWWZVrwblH3JErme9txAMgureU+XR72rdnCKWi3WCP4DGWtyK7ENhn
	FtSOG3ZbQVuMnViSxjMtJhOn95jIIw7e0a45pD55BARQBVxXKm+kKtLnh+ETjH0XuxDu
	RlcfYCtM7pGD+koLLoV46MZ/R+B30QOJd0ExsRDYhwKEWT3pi8oGedOckr2TtnD+8H5D
	Ad6vSY9fv1FSjLfgnk718eZ0G7UXn1jOnMfEWmpVAzZgPDqn/vmU2meBBxbIaxneM6hn
	86Vw==
X-Gm-Message-State: APjAAAWrnp/dKJw1R2ZUCohqkCraOukhcZQf2UGmzkNiYD7BM9HiF7eu
	f6BV38dw4K0ypAz4mN2oT8NAYnqyv9XOyChBGL4=
X-Google-Smtp-Source: APXvYqxjzLlkq8RSOF/WoVkQLcH9qjKB3Sv1jKzLLZo41JXIeqoFPwHHK8vqjy10Mq//9Hm5Tj7VW7o0Gu49YTTPPps=
X-Received: by 2002:a5e:9e42:: with SMTP id j2mr25963973ioq.133.1566419040923; 
	Wed, 21 Aug 2019 13:24:00 -0700 (PDT)
MIME-Version: 1.0
References: <20181202180832.GR8125@magnolia> <20181202181045.GS8125@magnolia>
In-Reply-To: <20181202181045.GS8125@magnolia>
From: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
Date: Wed, 21 Aug 2019 22:23:49 +0200
Message-ID: <CAHpGcM+WQYFHOOC8SzKq+=DuHVZ4fw4RHLTMUDN-o6GX3YtGvQ@mail.gmail.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Content-Type: text/plain; charset="UTF-8"
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.67]);
	Wed, 21 Aug 2019 20:24:01 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.67]);
	Wed, 21 Aug 2019 20:24:01 +0000 (UTC) for IP:'209.85.166.68'
	DOMAIN:'mail-io1-f68.google.com' HELO:'mail-io1-f68.google.com'
	FROM:'andreas.gruenbacher@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.1  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.166.68 mail-io1-f68.google.com 209.85.166.68
	mail-io1-f68.google.com <andreas.gruenbacher@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.67
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: jencce.kernel@gmail.com, Zorro Lang <zlang@redhat.com>,
	Dave Chinner <david@fromorbit.com>,
	overlayfs <linux-unionfs@vger.kernel.org>,
	fstests <fstests@vger.kernel.org>, linux-xfs <linux-xfs@vger.kernel.org>,
	cluster-devel <cluster-devel@redhat.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Amir Goldstein <amir73il@gmail.com>
Subject: Re: [Cluster-devel] [PATCH v2 2/2] iomap: partially revert
 4721a601099 (simulated directio short read on EFAULT)
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Wed, 21 Aug 2019 20:24:15 +0000 (UTC)

Hi Darrick,

Am So., 2. Dez. 2018 um 19:13 Uhr schrieb Darrick J. Wong
<darrick.wong@oracle.com>:
> From: Darrick J. Wong <darrick.wong@oracle.com>
>
> In commit 4721a601099, we tried to fix a problem wherein directio reads
> into a splice pipe will bounce EFAULT/EAGAIN all the way out to
> userspace by simulating a zero-byte short read.  This happens because
> some directio read implementations (xfs) will call
> bio_iov_iter_get_pages to grab pipe buffer pages and issue asynchronous
> reads, but as soon as we run out of pipe buffers that _get_pages call
> returns EFAULT, which the splice code translates to EAGAIN and bounces
> out to userspace.
>
> In that commit, the iomap code catches the EFAULT and simulates a
> zero-byte read, but that causes assertion errors on regular splice reads
> because xfs doesn't allow short directio reads.  This causes infinite
> splice() loops and assertion failures on generic/095 on overlayfs
> because xfs only permit total success or total failure of a directio
> operation.  The underlying issue in the pipe splice code has now been
> fixed by changing the pipe splice loop to avoid avoid reading more data
> than there is space in the pipe.
>
> Therefore, it's no longer necessary to simulate the short directio, so
> remove the hack from iomap.
>
> Fixes: 4721a601099 ("iomap: dio data corruption and spurious errors when pipes fill")
> Reported-by: Amir Goldstein <amir73il@gmail.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>
> ---
> v2: split into two patches per hch request
> ---
>  fs/iomap.c |    9 ---------
>  1 file changed, 9 deletions(-)
>
> diff --git a/fs/iomap.c b/fs/iomap.c
> index 3ffb776fbebe..d6bc98ae8d35 100644
> --- a/fs/iomap.c
> +++ b/fs/iomap.c
> @@ -1877,15 +1877,6 @@ iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
>                                 dio->wait_for_completion = true;
>                                 ret = 0;
>                         }
> -
> -                       /*
> -                        * Splicing to pipes can fail on a full pipe. We have to
> -                        * swallow this to make it look like a short IO
> -                        * otherwise the higher splice layers will completely
> -                        * mishandle the error and stop moving data.
> -                        */
> -                       if (ret == -EFAULT)
> -                               ret = 0;
>                         break;
>                 }
>                 pos += ret;

I'm afraid this breaks the following test case on xfs and gfs2, the
two current users of iomap_dio_rw.

Here, the splice system call fails with errno = EAGAIN when trying to
"move data" from a file opened with O_DIRECT into a pipe.

The test case can be run with option -d to not use O_DIRECT, which
makes the test succeed.

The -r option switches from reading from the pipe sequentially to
reading concurrently with the splice, which doesn't change the
behavior.

Any thoughts?

Thanks,
Andreas

=================================== 8< ===================================
#define _GNU_SOURCE
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/wait.h>
#include <unistd.h>
#include <fcntl.h>
#include <err.h>

#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <string.h>
#include <errno.h>

#define SECTOR_SIZE 512
#define BUFFER_SIZE (150 * SECTOR_SIZE)

void read_from_pipe(int fd, const char *filename, size_t size)
{
    char buffer[SECTOR_SIZE];
    size_t sz;
    ssize_t ret;

    while (size) {
        sz = size;
        if (sz > sizeof buffer)
            sz = sizeof buffer;
        ret = read(fd, buffer, sz);
        if (ret < 0)
            err(1, "read: %s", filename);
        if (ret == 0) {
            fprintf(stderr, "read: %s: unexpected EOF\n", filename);
            exit(1);
        }
        size -= sz;
    }
}

void do_splice1(int fd, const char *filename, size_t size)
{
    bool retried = false;
    int pipefd[2];

    if (pipe(pipefd) == -1)
        err(1, "pipe");
    while (size) {
        ssize_t spliced;

        spliced = splice(fd, NULL, pipefd[1], NULL, size, SPLICE_F_MOVE);
        if (spliced == -1) {
            if (errno == EAGAIN && !retried) {
                retried = true;
                fprintf(stderr, "retrying splice\n");
                sleep(1);
                continue;
            }
            err(1, "splice");
        }
        read_from_pipe(pipefd[0], filename, spliced);
        size -= spliced;
    }
    close(pipefd[0]);
    close(pipefd[1]);
}

void do_splice2(int fd, const char *filename, size_t size)
{
    bool retried = false;
    int pipefd[2];
    int pid;

    if (pipe(pipefd) == -1)
        err(1, "pipe");

    pid = fork();
    if (pid == 0) {
        close(pipefd[1]);
        read_from_pipe(pipefd[0], filename, size);
        exit(0);
    } else {
        close(pipefd[0]);
        while (size) {
            ssize_t spliced;

            spliced = splice(fd, NULL, pipefd[1], NULL, size, SPLICE_F_MOVE);
            if (spliced == -1) {
                if (errno == EAGAIN && !retried) {
                    retried = true;
                    fprintf(stderr, "retrying splice\n");
                    sleep(1);
                    continue;
                }
                err(1, "splice");
            }
            size -= spliced;
        }
        close(pipefd[1]);
        waitpid(pid, NULL, 0);
    }
}

void usage(const char *argv0)
{
    fprintf(stderr, "USAGE: %s [-rd] {filename}\n", basename(argv0));
    exit(2);
}

int main(int argc, char *argv[])
{
    void (*do_splice)(int fd, const char *filename, size_t size);
    const char *filename;
    char *buffer;
    int opt, open_flags, fd;
    ssize_t ret;

    do_splice = do_splice1;
    open_flags = O_CREAT | O_TRUNC | O_RDWR | O_DIRECT;

    while ((opt = getopt(argc, argv, "rd")) != -1) {
        switch(opt) {
        case 'r':
            do_splice = do_splice2;
            break;
        case 'd':
            open_flags &= ~O_DIRECT;
            break;
        default:  /* '?' */
            usage(argv[0]);
        }
    }

    if (optind >= argc)
        usage(argv[0]);
    filename = argv[optind];

    printf("%s reader %s O_DIRECT\n",
           do_splice == do_splice1 ? "sequential" : "concurrent",
           (open_flags & O_DIRECT) ? "with" : "without");

    buffer = aligned_alloc(SECTOR_SIZE, BUFFER_SIZE);
    if (buffer == NULL)
        err(1, "aligned_alloc");

    fd = open(filename, open_flags, 0666);
    if (fd == -1)
        err(1, "open: %s", filename);

    memset(buffer, 'x', BUFFER_SIZE);
    ret = write(fd, buffer, BUFFER_SIZE);
    if (ret < 0)
        err(1, "write: %s", filename);
    if (ret != BUFFER_SIZE) {
        fprintf(stderr, "%s: short write\n", filename);
        exit(1);
    }

    ret = lseek(fd, 0, SEEK_SET);
    if (ret != 0)
        err(1, "lseek: %s", filename);

    do_splice(fd, filename, BUFFER_SIZE);

    if (unlink(filename) == -1)
        err(1, "unlink: %s", filename);

    return 0;
}
=================================== 8< ===================================

