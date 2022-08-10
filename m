Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 105B358F3D9
	for <lists+cluster-devel@lfdr.de>; Wed, 10 Aug 2022 23:32:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660167155;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=m7O12mtRE9TkWg6wBbyGMp67dOvzpuyVtE/CzOg3fqw=;
	b=JIu5EvmhUmbU3vZnL+wjv3Gr4sq703+ZExUdnLjFSm2xnLZ6KnFwuQtvYQQKgW9gHdRZ9G
	gSjRaeY0G54hDqnZjJDxwMMQUsxCS5vzWxCsrTS695M3lukuzoWFDTpHXje50lPk5eynLd
	/Uju7VwaJIs23SMSkgTUruOciO88a1A=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-OWykCZCLMg-fVXPdJ_SyUQ-1; Wed, 10 Aug 2022 17:32:32 -0400
X-MC-Unique: OWykCZCLMg-fVXPdJ_SyUQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 28639299E77D;
	Wed, 10 Aug 2022 21:32:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 620601121314;
	Wed, 10 Aug 2022 21:32:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3A7EE1946A5D;
	Wed, 10 Aug 2022 21:32:30 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 39C181946A4F for <cluster-devel@listman.corp.redhat.com>;
 Wed, 10 Aug 2022 21:32:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 169272166B29; Wed, 10 Aug 2022 21:32:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 125372166B26
 for <cluster-devel@redhat.com>; Wed, 10 Aug 2022 21:32:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EA15829ABA18
 for <cluster-devel@redhat.com>; Wed, 10 Aug 2022 21:32:28 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-335-UyS1z1-bMAqU0R1XRtTtsA-1; Wed, 10 Aug 2022 17:32:25 -0400
X-MC-Unique: UyS1z1-bMAqU0R1XRtTtsA-1
Received: by mail-ot1-f49.google.com with SMTP id
 q6-20020a05683033c600b0061d2f64df5dso11454565ott.13; 
 Wed, 10 Aug 2022 14:32:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=m7O12mtRE9TkWg6wBbyGMp67dOvzpuyVtE/CzOg3fqw=;
 b=UleVE8JDyPXmx2vKCBTZFM1soTTxkJJK8kN2avqqXwdKIJRAkiZZ5i598oZM7hrM/A
 YSucOGJutaRCVAJ8doOLTDMp6PBzIKwIJlJNW9cKJe2Mt7KaZ1ywgpAjWhjCjZEl62De
 wDHGRNuAXEgZLd6u5EMMT7OR0dIB/Qkhl9+Oroo5l4UYmnY8iB2XZI4pdoemxxpHWo1h
 FTo7PiWVe4gMQr6AiSoC5jsjq2ME1O89oiYYvWEdj9YG9HFsK2vo2yBUy6MfnVtvfaqT
 U59+/o4DLs0eeL3MK2sQu6WrPVMVVrsCp/W1vokO/IAwIGZFYnSbug50MpGb+cKJIpoK
 +GHw==
X-Gm-Message-State: ACgBeo07QoqHtUgmbGHNEfIvGEUS6AGBEYFIWPWTUiaqznGCGDOh7Qws
 KHrD69eW8IJLE8tV5tNQhzfLWwpjNW7GmjiBYsw=
X-Google-Smtp-Source: AA6agR5WI4LfxUaJ5EfyY3qi3PgJRxGO7G3AYltcG2S84baL4CCgM+/v/VC+ix3GmYp1IOK0IPYYQDO5aJHqzAN+vDM=
X-Received: by 2002:a05:6830:6388:b0:61c:80a9:d5b6 with SMTP id
 ch8-20020a056830638800b0061c80a9d5b6mr11139969otb.124.1660167144427; Wed, 10
 Aug 2022 14:32:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220719041311.709250-1-hch@lst.de>
 <20220728111016.uwbaywprzkzne7ib@quack3>
 <20220729092216.GE3493@suse.de> <20220729141145.GA31605@lst.de>
 <Yufx5jpyJ+zcSJ4e@cmpxchg.org> <YvQYjpDHH5KckCrw@casper.infradead.org>
In-Reply-To: <YvQYjpDHH5KckCrw@casper.infradead.org>
From: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
Date: Wed, 10 Aug 2022 23:32:06 +0200
Message-ID: <CAHpGcMLNKrOFxktaH9Wxq0M9O-m+DPrdbB7FQt7qwkzQdm-a-w@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Subject: Re: [Cluster-devel] remove iomap_writepage v2
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
Cc: Naohiro Aota <naohiro.aota@wdc.com>, linux-xfs <linux-xfs@vger.kernel.org>,
 Jan Kara <jack@suse.cz>, Linux-MM <linux-mm@kvack.org>,
 "Darrick J. Wong" <djwong@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 cluster-devel <cluster-devel@redhat.com>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Mel Gorman <mgorman@suse.de>, Johannes Weiner <hannes@cmpxchg.org>,
 Johannes Thumshirn <jth@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Vlastimil Babka <vbabka@suse.cz>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Am Mi., 10. Aug. 2022 um 22:57 Uhr schrieb Matthew Wilcox <willy@infradead.org>:
> On Mon, Aug 01, 2022 at 11:31:50AM -0400, Johannes Weiner wrote:
> > XFS hasn't had a ->writepage call for a while. After LSF I internally
> > tested dropping btrfs' callback, and the results looked good: no OOM
> > kills with dirty/writeback pages remaining, performance parity. Then I
> > went on vacation and Christoph beat me to the patch :)
>
> To avoid duplicating work with you or Christoph ... it seems like the
> plan is to kill ->writepage entirely soon, so there's no point in me
> doing a sweep of all the filesystems to convert ->writepage to
> ->write_folio, correct?
>
> I assume the plan for filesystems which have a writepage but don't have
> a ->writepages (9p, adfs, affs, bfs, ecryptfs, gfs2, hostfs, jfs, minix,
> nilfs2, ntfs, ocfs2, reiserfs, sysv, ubifs, udf, ufs, vboxsf) is to give
> them a writepages, modelled on iomap_writepages().  Seems that adding
> a block_writepages() might be a useful thing for me to do?

Hmm, gfs2 does have gfs2_writepages() and gfs2_jdata_writepages()
functions, so it should probably be fine.

Thanks,
Andreas

