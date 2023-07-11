Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB2274E2EB
	for <lists+cluster-devel@lfdr.de>; Tue, 11 Jul 2023 03:04:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689037447;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cfkyDNuGunyt2pahXasLvrYNHpv3rJ6D8ARH5IQj+MU=;
	b=IRtnH6jcP9z8dBVxFFWsrCE4vf9IMb9dnNwFEmd+WlmrYNSN4W4EEcOLItHLs3yVQC8oaF
	ve6RBKc8/r0YpvUZjkCx8z0ySlFnoXZiQSYvdm1Jz71id5AlUmRc3cF5hqhboyacEoRADg
	ij31uVf1TFpufY0db9vsS2Q5Iw1PJ78=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-McJWAW0QP9WwCCwQpHKnyQ-1; Mon, 10 Jul 2023 21:04:04 -0400
X-MC-Unique: McJWAW0QP9WwCCwQpHKnyQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 812943C11A02;
	Tue, 11 Jul 2023 01:04:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D9804145414F;
	Tue, 11 Jul 2023 01:03:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6926719465BC;
	Tue, 11 Jul 2023 01:03:59 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8BA2A19465B8 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 11 Jul 2023 01:03:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7406A40C2070; Tue, 11 Jul 2023 01:03:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CC0C40C206F
 for <cluster-devel@redhat.com>; Tue, 11 Jul 2023 01:03:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F468185A792
 for <cluster-devel@redhat.com>; Tue, 11 Jul 2023 01:03:57 +0000 (UTC)
Received: from out28-59.mail.aliyun.com (out28-59.mail.aliyun.com
 [115.124.28.59]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-_gR8iJmmNFe2WxaVWA39lA-1; Mon, 10 Jul 2023 21:03:55 -0400
X-MC-Unique: _gR8iJmmNFe2WxaVWA39lA-1
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1185371|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.035348-0.000604155-0.964048;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047190; MF=wangyugui@e16-tech.com; NM=1;
 PH=DS; RN=9; RT=9; SR=0; TI=SMTPD_---.TqaAAIB_1689037110
Received: from 192.168.2.112(mailfrom:wangyugui@e16-tech.com
 fp:SMTPD_---.TqaAAIB_1689037110) by smtp.aliyun-inc.com;
 Tue, 11 Jul 2023 08:58:38 +0800
Date: Tue, 11 Jul 2023 08:58:39 +0800
From: Wang Yugui <wangyugui@e16-tech.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
In-Reply-To: <CAHc6FU5YYADEE1m2skcZxOb5fC24JDcJvHtBoq6ZCttB3BhObA@mail.gmail.com>
References: <20230528235314.7852.409509F4@e16-tech.com>
 <CAHc6FU5YYADEE1m2skcZxOb5fC24JDcJvHtBoq6ZCttB3BhObA@mail.gmail.com>
Message-Id: <20230711085830.FA1E.409509F4@e16-tech.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
 Dave Chinner <david@fromorbit.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, cluster-devel@redhat.com,
 linux-fsdevel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: e16-tech.com
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

Hi,

> Hi Wang Yugui,
> 
> On Sun, May 28, 2023 at 5:53?PM Wang Yugui <wangyugui@e16-tech.com> wrote:
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
> 
> In any case, the regression introduced by commit e1fa9ea85ce8 should
> be fixed by commit c8ed1b359312 ("gfs2: Fix duplicate
> should_fault_in_pages() call"), which ended up in v6.5-rc1.
> 
> Could you please check where we end up with that fix?

I applied c8ed1b359312 on 6.1.36.
# the build/test of 6.5-rc1 is yet not ready.

fio performance result:
  WRITE: bw=2683MiB/s (2813MB/s)

but  the performance of fio 'Laying out IO file' is improved.
Jobs: 4 (f=4): [F(4)][100.0%][w=5168MiB/s][w=5168 IOPS][eta 00m:00s]

so there seems 2 problems,  one is fixed by c8ed1b359312.
but another is still left.

Best Regards
Wang Yugui (wangyugui@e16-tech.com)
2023/07/11


