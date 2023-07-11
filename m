Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1798A74E3EE
	for <lists+cluster-devel@lfdr.de>; Tue, 11 Jul 2023 04:09:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689041347;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XyKenLjvs1L+lR6yAc0FRSo1jPgG5FIXSLMnx1/HtTE=;
	b=VpwAc/lrRkB0gsscoc13l4ZbC7dcCD41jlk7z2hG7UIFO5bXA2mbNqoYbqK7JAGFmmjKZn
	Ie/Q2IlD7ocuGOV3E9OyiCtkC1vydoOUAjiXaNHSzFpp9BSsefdV8fvOCSycxqXiFtk6Ff
	sEqeHu/lw2BIjnq9UBV9kDDZBCn+oMw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-AZ4cxj1HMbWhQkMGL9dy7Q-1; Mon, 10 Jul 2023 22:09:04 -0400
X-MC-Unique: AZ4cxj1HMbWhQkMGL9dy7Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB7141006849;
	Tue, 11 Jul 2023 02:09:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C8A35492B01;
	Tue, 11 Jul 2023 02:09:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 53B0819465BC;
	Tue, 11 Jul 2023 02:09:02 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2AD6919465B8 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 11 Jul 2023 02:09:01 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E9BB3111DCE1; Tue, 11 Jul 2023 02:09:00 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E271A111DCE0
 for <cluster-devel@redhat.com>; Tue, 11 Jul 2023 02:09:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C43A23814943
 for <cluster-devel@redhat.com>; Tue, 11 Jul 2023 02:09:00 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-642-Rx1QtWZ9ONqKSs0APV1WfQ-1; Mon,
 10 Jul 2023 22:08:58 -0400
X-MC-Unique: Rx1QtWZ9ONqKSs0APV1WfQ-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1qJ2o9-00FCD7-A3; Tue, 11 Jul 2023 02:08:53 +0000
Date: Tue, 11 Jul 2023 03:08:53 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <ZKy5tYed3EiPPZSi@casper.infradead.org>
References: <20230523085929.614A.409509F4@e16-tech.com>
 <20230528235314.7852.409509F4@e16-tech.com>
 <CAHc6FU5YYADEE1m2skcZxOb5fC24JDcJvHtBoq6ZCttB3BhObA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHc6FU5YYADEE1m2skcZxOb5fC24JDcJvHtBoq6ZCttB3BhObA@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [Cluster-devel] gfs2 write bandwidth regression on 6.4-rc3
 compareto 5.15.y
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: linux-xfs@vger.kernel.org, "Darrick J . Wong" <djwong@kernel.org>,
 Dave Chinner <david@fromorbit.com>, cluster-devel@redhat.com,
 linux-fsdevel@vger.kernel.org, Wang Yugui <wangyugui@e16-tech.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: infradead.org
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Jul 10, 2023 at 03:19:54PM +0200, Andreas Gruenbacher wrote:
> Hi Wang Yugui,
> 
> On Sun, May 28, 2023 at 5:53 PM Wang Yugui <wangyugui@e16-tech.com> wrote:
> > Hi,
> >
> > > Hi,
> > >
> > > gfs2 write bandwidth regression on 6.4-rc3 compare to 5.15.y.
> > >
> > > we added  linux-xfs@ and linux-fsdevel@ because some related problem[1]
> > > and related patches[2].
> > >
> > > we compared 6.4-rc3(rather than 6.1.y) to 5.15.y because some related patches[2]
> > > work only for 6.4 now.
> > >
> > > [1] https://lore.kernel.org/linux-xfs/20230508172406.1CF3.409509F4@e16-tech.com/
> > > [2] https://lore.kernel.org/linux-xfs/20230520163603.1794256-1-willy@infradead.org/
> > >
> > >
> > > test case:
> > > 1) PCIe3 SSD *4 with LVM
> > > 2) gfs2 lock_nolock
> > >     gfs2 attr(T) GFS2_AF_ORLOV
> > >    # chattr +T /mnt/test
> > > 3) fio
> > > fio --name=global --rw=write -bs=1024Ki -size=32Gi -runtime=30 -iodepth 1
> > > -ioengine sync -zero_buffers=1 -direct=0 -end_fsync=1 -numjobs=1 \
> > >       -name write-bandwidth-1 -filename=/mnt/test/sub1/1.txt \
> > >       -name write-bandwidth-2 -filename=/mnt/test/sub2/1.txt \
> > >       -name write-bandwidth-3 -filename=/mnt/test/sub3/1.txt \
> > >       -name write-bandwidth-4 -filename=/mnt/test/sub4/1.txt
> > > 4) patches[2] are applied to 6.4-rc3.
> > >
> > >
> > > 5.15.y result
> > >       fio WRITE: bw=5139MiB/s (5389MB/s),
> > > 6.4-rc3 result
> > >       fio  WRITE: bw=2599MiB/s (2725MB/s)
> >
> > more test result:
> >
> > 5.17.0  WRITE: bw=4988MiB/s (5231MB/s)
> > 5.18.0  WRITE: bw=5165MiB/s (5416MB/s)
> > 5.19.0  WRITE: bw=5511MiB/s (5779MB/s)
> > 6.0.5   WRITE: bw=3055MiB/s (3203MB/s), WRITE: bw=3225MiB/s (3382MB/s)
> > 6.1.30  WRITE: bw=2579MiB/s (2705MB/s)
> >
> > so this regression  happen in some code introduced in 6.0,
> > and maybe some minor regression in 6.1 too?
> 
> thanks for this bug report. Bob has noticed a similar looking
> performance regression recently, and it turned out that commit
> e1fa9ea85ce8 ("gfs2: Stop using glock holder auto-demotion for now")
> inadvertently caused buffered writes to fall back to writing single
> pages instead of multiple pages at once. That patch was added in
> v5.18, so it doesn't perfectly align with the regression history
> you're reporting, but maybe there's something else going on that we're
> not aware of.

Dave gave a good explanation of the problem here:

https://lore.kernel.org/linux-xfs/ZKybxCxzmuI1TFYn@dread.disaster.area/

It's a pagecache locking contention problem rather than an individual
filesystem problem.

... are you interested in supporting large folios in gfs2?  ;-)

