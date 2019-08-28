Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 499F9A04C1
	for <lists+cluster-devel@lfdr.de>; Wed, 28 Aug 2019 16:24:26 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A37988AC6FD;
	Wed, 28 Aug 2019 14:24:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AD8E45D6B0;
	Wed, 28 Aug 2019 14:24:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 07B50C593;
	Wed, 28 Aug 2019 14:24:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7SEOGuc005316 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 28 Aug 2019 10:24:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E68F0196AE; Wed, 28 Aug 2019 14:24:16 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx18.extmail.prod.ext.phx2.redhat.com
	[10.5.110.47])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DFC93194B2;
	Wed, 28 Aug 2019 14:24:14 +0000 (UTC)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AF25E308219E;
	Wed, 28 Aug 2019 14:23:54 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x7SEJc2W082750; Wed, 28 Aug 2019 14:23:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=date : from : to : cc
	: subject : message-id : references : mime-version : content-type :
	content-transfer-encoding : in-reply-to; s=corp-2019-08-05;
	bh=vgrDwVHdmJZ9aYJbqbUl1TJIyAPUEDAJ1ALO9+oPAUw=;
	b=q0qOV458W/bztCNufWPs26s3Ym+GRSQ1ziezYIQ0ZFdTRRngupxVv3OQaCUmcLUtLiLu
	LnHrBMgGaR7OHU5wxRKNCF1KHDG4YVV4HdudKI68Sli0kgcA0fu0KDZSfyvlEXHxj3+3
	rg//5L9oBD/UoXPRXQdeFNrMWzjPQ45kODxgFqxK0NXMFewF8oXglYMYFKMEWoNw34OY
	3FYbhLvRoAHcI7/MJ9IxOWjWWowXRCh5CGntTiZ3Cr+64eDmpx27R9t2k2oqIPrtqvLO
	y0mBeYh+NHIsdnynZPgmhxbcvqC5MH3mKvHtKug+GkznZMFuTdm8stQG185jIyQsFqZE
	yQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by userp2130.oracle.com with ESMTP id 2unu76829k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 Aug 2019 14:23:36 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x7SEN4I9020552; Wed, 28 Aug 2019 14:23:35 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
	by aserp3030.oracle.com with ESMTP id 2unduq14tx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 Aug 2019 14:23:35 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
	by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x7SENY8U012960;
	Wed, 28 Aug 2019 14:23:34 GMT
Received: from localhost (/67.169.218.210)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Wed, 28 Aug 2019 07:23:33 -0700
Date: Wed, 28 Aug 2019 07:23:32 -0700
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Andreas =?iso-8859-1?Q?Gr=FCnbacher?= <andreas.gruenbacher@gmail.com>
Message-ID: <20190828142332.GT1037422@magnolia>
References: <20181202180832.GR8125@magnolia> <20181202181045.GS8125@magnolia>
	<CAHpGcM+WQYFHOOC8SzKq+=DuHVZ4fw4RHLTMUDN-o6GX3YtGvQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHpGcM+WQYFHOOC8SzKq+=DuHVZ4fw4RHLTMUDN-o6GX3YtGvQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9363
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
	adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.0.1-1906280000 definitions=main-1908280151
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9363
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
	lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
	adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
	definitions=main-1908280150
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.47]); Wed, 28 Aug 2019 14:24:09 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]);
	Wed, 28 Aug 2019 14:24:09 +0000 (UTC) for IP:'156.151.31.86'
	DOMAIN:'userp2130.oracle.com' HELO:'userp2130.oracle.com'
	FROM:'darrick.wong@oracle.com' RCPT:''
X-RedHat-Spam-Score: -102.4  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_MED, SPF_HELO_PASS, SPF_NONE,
	UNPARSEABLE_RELAY,
	USER_IN_WHITELIST) 156.151.31.86 userp2130.oracle.com 156.151.31.86
	userp2130.oracle.com <darrick.wong@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.47
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.69]); Wed, 28 Aug 2019 14:24:25 +0000 (UTC)

On Wed, Aug 21, 2019 at 10:23:49PM +0200, Andreas Grünbacher wrote:
> Hi Darrick,
> 
> Am So., 2. Dez. 2018 um 19:13 Uhr schrieb Darrick J. Wong
> <darrick.wong@oracle.com>:
> > From: Darrick J. Wong <darrick.wong@oracle.com>
> >
> > In commit 4721a601099, we tried to fix a problem wherein directio reads
> > into a splice pipe will bounce EFAULT/EAGAIN all the way out to
> > userspace by simulating a zero-byte short read.  This happens because
> > some directio read implementations (xfs) will call
> > bio_iov_iter_get_pages to grab pipe buffer pages and issue asynchronous
> > reads, but as soon as we run out of pipe buffers that _get_pages call
> > returns EFAULT, which the splice code translates to EAGAIN and bounces
> > out to userspace.
> >
> > In that commit, the iomap code catches the EFAULT and simulates a
> > zero-byte read, but that causes assertion errors on regular splice reads
> > because xfs doesn't allow short directio reads.  This causes infinite
> > splice() loops and assertion failures on generic/095 on overlayfs
> > because xfs only permit total success or total failure of a directio
> > operation.  The underlying issue in the pipe splice code has now been
> > fixed by changing the pipe splice loop to avoid avoid reading more data
> > than there is space in the pipe.
> >
> > Therefore, it's no longer necessary to simulate the short directio, so
> > remove the hack from iomap.
> >
> > Fixes: 4721a601099 ("iomap: dio data corruption and spurious errors when pipes fill")
> > Reported-by: Amir Goldstein <amir73il@gmail.com>
> > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>
> > ---
> > v2: split into two patches per hch request
> > ---
> >  fs/iomap.c |    9 ---------
> >  1 file changed, 9 deletions(-)
> >
> > diff --git a/fs/iomap.c b/fs/iomap.c
> > index 3ffb776fbebe..d6bc98ae8d35 100644
> > --- a/fs/iomap.c
> > +++ b/fs/iomap.c
> > @@ -1877,15 +1877,6 @@ iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
> >                                 dio->wait_for_completion = true;
> >                                 ret = 0;
> >                         }
> > -
> > -                       /*
> > -                        * Splicing to pipes can fail on a full pipe. We have to
> > -                        * swallow this to make it look like a short IO
> > -                        * otherwise the higher splice layers will completely
> > -                        * mishandle the error and stop moving data.
> > -                        */
> > -                       if (ret == -EFAULT)
> > -                               ret = 0;
> >                         break;
> >                 }
> >                 pos += ret;
> 
> I'm afraid this breaks the following test case on xfs and gfs2, the
> two current users of iomap_dio_rw.

Hmm, I had kinda wondered if regular pipes still needed this help.
Evidently we don't have a lot of splice tests in fstests. :(

> Here, the splice system call fails with errno = EAGAIN when trying to
> "move data" from a file opened with O_DIRECT into a pipe.
> 
> The test case can be run with option -d to not use O_DIRECT, which
> makes the test succeed.
> 
> The -r option switches from reading from the pipe sequentially to
> reading concurrently with the splice, which doesn't change the
> behavior.
> 
> Any thoughts?

This would be great as an xfstest! :)

Do you have one ready to go, or should I just make one from the source
code?

--D

> Thanks,
> Andreas
> 
> =================================== 8< ===================================
> #define _GNU_SOURCE
> #include <sys/types.h>
> #include <sys/stat.h>
> #include <sys/wait.h>
> #include <unistd.h>
> #include <fcntl.h>
> #include <err.h>
> 
> #include <stdlib.h>
> #include <stdio.h>
> #include <stdbool.h>
> #include <string.h>
> #include <errno.h>
> 
> #define SECTOR_SIZE 512
> #define BUFFER_SIZE (150 * SECTOR_SIZE)
> 
> void read_from_pipe(int fd, const char *filename, size_t size)
> {
>     char buffer[SECTOR_SIZE];
>     size_t sz;
>     ssize_t ret;
> 
>     while (size) {
>         sz = size;
>         if (sz > sizeof buffer)
>             sz = sizeof buffer;
>         ret = read(fd, buffer, sz);
>         if (ret < 0)
>             err(1, "read: %s", filename);
>         if (ret == 0) {
>             fprintf(stderr, "read: %s: unexpected EOF\n", filename);
>             exit(1);
>         }
>         size -= sz;
>     }
> }
> 
> void do_splice1(int fd, const char *filename, size_t size)
> {
>     bool retried = false;
>     int pipefd[2];
> 
>     if (pipe(pipefd) == -1)
>         err(1, "pipe");
>     while (size) {
>         ssize_t spliced;
> 
>         spliced = splice(fd, NULL, pipefd[1], NULL, size, SPLICE_F_MOVE);
>         if (spliced == -1) {
>             if (errno == EAGAIN && !retried) {
>                 retried = true;
>                 fprintf(stderr, "retrying splice\n");
>                 sleep(1);
>                 continue;
>             }
>             err(1, "splice");
>         }
>         read_from_pipe(pipefd[0], filename, spliced);
>         size -= spliced;
>     }
>     close(pipefd[0]);
>     close(pipefd[1]);
> }
> 
> void do_splice2(int fd, const char *filename, size_t size)
> {
>     bool retried = false;
>     int pipefd[2];
>     int pid;
> 
>     if (pipe(pipefd) == -1)
>         err(1, "pipe");
> 
>     pid = fork();
>     if (pid == 0) {
>         close(pipefd[1]);
>         read_from_pipe(pipefd[0], filename, size);
>         exit(0);
>     } else {
>         close(pipefd[0]);
>         while (size) {
>             ssize_t spliced;
> 
>             spliced = splice(fd, NULL, pipefd[1], NULL, size, SPLICE_F_MOVE);
>             if (spliced == -1) {
>                 if (errno == EAGAIN && !retried) {
>                     retried = true;
>                     fprintf(stderr, "retrying splice\n");
>                     sleep(1);
>                     continue;
>                 }
>                 err(1, "splice");
>             }
>             size -= spliced;
>         }
>         close(pipefd[1]);
>         waitpid(pid, NULL, 0);
>     }
> }
> 
> void usage(const char *argv0)
> {
>     fprintf(stderr, "USAGE: %s [-rd] {filename}\n", basename(argv0));
>     exit(2);
> }
> 
> int main(int argc, char *argv[])
> {
>     void (*do_splice)(int fd, const char *filename, size_t size);
>     const char *filename;
>     char *buffer;
>     int opt, open_flags, fd;
>     ssize_t ret;
> 
>     do_splice = do_splice1;
>     open_flags = O_CREAT | O_TRUNC | O_RDWR | O_DIRECT;
> 
>     while ((opt = getopt(argc, argv, "rd")) != -1) {
>         switch(opt) {
>         case 'r':
>             do_splice = do_splice2;
>             break;
>         case 'd':
>             open_flags &= ~O_DIRECT;
>             break;
>         default:  /* '?' */
>             usage(argv[0]);
>         }
>     }
> 
>     if (optind >= argc)
>         usage(argv[0]);
>     filename = argv[optind];
> 
>     printf("%s reader %s O_DIRECT\n",
>            do_splice == do_splice1 ? "sequential" : "concurrent",
>            (open_flags & O_DIRECT) ? "with" : "without");
> 
>     buffer = aligned_alloc(SECTOR_SIZE, BUFFER_SIZE);
>     if (buffer == NULL)
>         err(1, "aligned_alloc");
> 
>     fd = open(filename, open_flags, 0666);
>     if (fd == -1)
>         err(1, "open: %s", filename);
> 
>     memset(buffer, 'x', BUFFER_SIZE);
>     ret = write(fd, buffer, BUFFER_SIZE);
>     if (ret < 0)
>         err(1, "write: %s", filename);
>     if (ret != BUFFER_SIZE) {
>         fprintf(stderr, "%s: short write\n", filename);
>         exit(1);
>     }
> 
>     ret = lseek(fd, 0, SEEK_SET);
>     if (ret != 0)
>         err(1, "lseek: %s", filename);
> 
>     do_splice(fd, filename, BUFFER_SIZE);
> 
>     if (unlink(filename) == -1)
>         err(1, "unlink: %s", filename);
> 
>     return 0;
> }
> =================================== 8< ===================================

