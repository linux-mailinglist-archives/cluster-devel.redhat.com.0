Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 356C2A0523
	for <lists+cluster-devel@lfdr.de>; Wed, 28 Aug 2019 16:39:16 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B030930044CE;
	Wed, 28 Aug 2019 14:39:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E9D11001B00;
	Wed, 28 Aug 2019 14:39:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 83A3B1802217;
	Wed, 28 Aug 2019 14:39:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7SEcGYW005679 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 28 Aug 2019 10:38:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6D1764116; Wed, 28 Aug 2019 14:38:16 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 65D704D3E;
	Wed, 28 Aug 2019 14:38:13 +0000 (UTC)
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AA27B2A09D4;
	Wed, 28 Aug 2019 14:38:11 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id e20so6275407iob.9;
	Wed, 28 Aug 2019 07:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=G5udQkW/CM2lxlViX/26GN8cs4HunMByYhQD6+dx7mc=;
	b=pdLrAkH/k8QFoMQhZgs8HaZrHnvCDVfywCMzjjARVmam2Vm+uBgdLIVgLodKWzC7jZ
	bjLaH5cjyLKVzTNzk3Svzo0X5H69V5ZA3cjYNPVD+9U3hfi2RiOi2ucZYMJSbJGtK0QJ
	CnUYMK9/2JFUx14RVA4dEHe/sEY1gUCBrasd2O0O08OEgBKDZovxe9+iaQUkv29Cq1Kp
	Y4YAqdATkcpbvfqSu7gbWD0br+VHyJNsydRy6WKTimt7Da0bI56m5wa0fo2yrKPMZZ5G
	PxITZ+g0J10gA7PyL72B89p55jebyF6AEvETm3C1OvAoFQy/nsUIfm49nSvAORfdpkJa
	vUVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=G5udQkW/CM2lxlViX/26GN8cs4HunMByYhQD6+dx7mc=;
	b=Mz2O9kKk760bl2LQ16qInKi9Ojdz32MkA77wNR6yU+jam8vtX7lo02HF1pwjmw6fPW
	p6q0ZcgJ772qrAQGcccsybGZ8ISSV54/oAg61EqdF1ONAx+3nsqTAM9Q/nb9c0nBJdwU
	81xHZaPW5nYemb0XN9k2/Wt2GG8HWdfO6hAJp27TwvdiCw3bslmUdf7wFm8mxjVU7kv6
	WAkN8iZRrkKaexx+9mU6zv1vQWGU7BGRyty1IW8FHUVhvq+m2oMMlMB3vMTnqfCBHLFb
	vJX2jfKYt1Z675jZGbsSOAXkBJdMlV43GyHASNUgH3EHKNIiiH5Omcqx5UWVBwociA5g
	opTg==
X-Gm-Message-State: APjAAAVVkHHJHxseqcU4DDzqHyLVCd0ZknWtky+HvGA2Cfp7PXufbP+r
	DImGJU8qBPGpBSi3qHMuENBzTC7qG5NNR9/87Sw=
X-Google-Smtp-Source: APXvYqy0VFM3NLgaj2QrNG/mcXAuZZBb3xoVXU7zi5NXBF72Oi/AEK00tMZIlYBogfH8+OAXIqqwPP+N7gdbE/5bnJc=
X-Received: by 2002:a5e:9314:: with SMTP id k20mr4661621iom.245.1567003090860; 
	Wed, 28 Aug 2019 07:38:10 -0700 (PDT)
MIME-Version: 1.0
References: <20181202180832.GR8125@magnolia> <20181202181045.GS8125@magnolia>
	<CAHpGcM+WQYFHOOC8SzKq+=DuHVZ4fw4RHLTMUDN-o6GX3YtGvQ@mail.gmail.com>
	<20190828142332.GT1037422@magnolia>
In-Reply-To: <20190828142332.GT1037422@magnolia>
From: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
Date: Wed, 28 Aug 2019 16:37:59 +0200
Message-ID: <CAHpGcMLGWVssWAC1PqBJevr1+1rE_hj4QN27D26j7-Fp_Kzpsg@mail.gmail.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Content-Type: text/plain; charset="UTF-8"
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 28 Aug 2019 14:38:11 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]);
	Wed, 28 Aug 2019 14:38:11 +0000 (UTC) for IP:'209.85.166.66'
	DOMAIN:'mail-io1-f66.google.com' HELO:'mail-io1-f66.google.com'
	FROM:'andreas.gruenbacher@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.099  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.166.66 mail-io1-f66.google.com 209.85.166.66
	mail-io1-f66.google.com <andreas.gruenbacher@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.38
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Content-Transfer-Encoding: 8bit
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x7SEcGYW005679
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Wed, 28 Aug 2019 14:39:15 +0000 (UTC)

Am Mi., 28. Aug. 2019 um 16:23 Uhr schrieb Darrick J. Wong
<darrick.wong@oracle.com>:
> On Wed, Aug 21, 2019 at 10:23:49PM +0200, Andreas Grünbacher wrote:
> > Hi Darrick,
> >
> > Am So., 2. Dez. 2018 um 19:13 Uhr schrieb Darrick J. Wong
> > <darrick.wong@oracle.com>:
> > > From: Darrick J. Wong <darrick.wong@oracle.com>
> > >
> > > In commit 4721a601099, we tried to fix a problem wherein directio reads
> > > into a splice pipe will bounce EFAULT/EAGAIN all the way out to
> > > userspace by simulating a zero-byte short read.  This happens because
> > > some directio read implementations (xfs) will call
> > > bio_iov_iter_get_pages to grab pipe buffer pages and issue asynchronous
> > > reads, but as soon as we run out of pipe buffers that _get_pages call
> > > returns EFAULT, which the splice code translates to EAGAIN and bounces
> > > out to userspace.
> > >
> > > In that commit, the iomap code catches the EFAULT and simulates a
> > > zero-byte read, but that causes assertion errors on regular splice reads
> > > because xfs doesn't allow short directio reads.  This causes infinite
> > > splice() loops and assertion failures on generic/095 on overlayfs
> > > because xfs only permit total success or total failure of a directio
> > > operation.  The underlying issue in the pipe splice code has now been
> > > fixed by changing the pipe splice loop to avoid avoid reading more data
> > > than there is space in the pipe.
> > >
> > > Therefore, it's no longer necessary to simulate the short directio, so
> > > remove the hack from iomap.
> > >
> > > Fixes: 4721a601099 ("iomap: dio data corruption and spurious errors when pipes fill")
> > > Reported-by: Amir Goldstein <amir73il@gmail.com>
> > > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > > Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>
> > > ---
> > > v2: split into two patches per hch request
> > > ---
> > >  fs/iomap.c |    9 ---------
> > >  1 file changed, 9 deletions(-)
> > >
> > > diff --git a/fs/iomap.c b/fs/iomap.c
> > > index 3ffb776fbebe..d6bc98ae8d35 100644
> > > --- a/fs/iomap.c
> > > +++ b/fs/iomap.c
> > > @@ -1877,15 +1877,6 @@ iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
> > >                                 dio->wait_for_completion = true;
> > >                                 ret = 0;
> > >                         }
> > > -
> > > -                       /*
> > > -                        * Splicing to pipes can fail on a full pipe. We have to
> > > -                        * swallow this to make it look like a short IO
> > > -                        * otherwise the higher splice layers will completely
> > > -                        * mishandle the error and stop moving data.
> > > -                        */
> > > -                       if (ret == -EFAULT)
> > > -                               ret = 0;
> > >                         break;
> > >                 }
> > >                 pos += ret;
> >
> > I'm afraid this breaks the following test case on xfs and gfs2, the
> > two current users of iomap_dio_rw.
>
> Hmm, I had kinda wondered if regular pipes still needed this help.
> Evidently we don't have a lot of splice tests in fstests. :(

So what do you suggest as a fix?

> > Here, the splice system call fails with errno = EAGAIN when trying to
> > "move data" from a file opened with O_DIRECT into a pipe.
> >
> > The test case can be run with option -d to not use O_DIRECT, which
> > makes the test succeed.
> >
> > The -r option switches from reading from the pipe sequentially to
> > reading concurrently with the splice, which doesn't change the
> > behavior.
> >
> > Any thoughts?
>
> This would be great as an xfstest! :)

Or perhaps something generalized from it.

> Do you have one ready to go, or should I just make one from the source
> code?

The bug originally triggered in our internal cluster test system and
I've recreated the test case I've included from the strace. That's all
I have for now; feel free to take it, of course.

It could be that the same condition can be triggered with one of the
existing utilities (fio/fsstress/...).

Thanks,
Andreas

