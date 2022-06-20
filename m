Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4F05522AE
	for <lists+cluster-devel@lfdr.de>; Mon, 20 Jun 2022 19:20:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655745654;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=o8BAnuD3pPwvygyVgJgWFg7Drd3YyIxnkx0OOYkXRTU=;
	b=h2/Un7fZG1fX3T4KuNmRceDegPQMEdWGR3lO1fr/92YMuEsNE65bs4gqJO3p5yFQW79TeX
	TpzOFH3aYNcU7V20nxEaZD/qTttU8NddIFoAE4/QwsG9uzk9tHmGmM1yHbV1QM7tHSLGwt
	ej0x1f7NotFsAy8xPl7jA8Rbz+5pCeU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-7WRTdh9BPumLYpMDAJAn1g-1; Mon, 20 Jun 2022 13:20:50 -0400
X-MC-Unique: 7WRTdh9BPumLYpMDAJAn1g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C623299E759;
	Mon, 20 Jun 2022 17:20:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 401CE141510D;
	Mon, 20 Jun 2022 17:20:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E26CD1947072;
	Mon, 20 Jun 2022 17:20:46 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D9E8F1947069 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 20 Jun 2022 17:20:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B3CF91410F3B; Mon, 20 Jun 2022 17:20:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AFAE31410F35
 for <cluster-devel@redhat.com>; Mon, 20 Jun 2022 17:20:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 94718185A7A4
 for <cluster-devel@redhat.com>; Mon, 20 Jun 2022 17:20:45 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-_ipe64adMyGwky0YZ0d3MQ-1; Mon, 20 Jun 2022 13:20:44 -0400
X-MC-Unique: _ipe64adMyGwky0YZ0d3MQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 y18-20020adfdf12000000b0021b94ba4c37so342477wrl.11
 for <cluster-devel@redhat.com>; Mon, 20 Jun 2022 10:20:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o8BAnuD3pPwvygyVgJgWFg7Drd3YyIxnkx0OOYkXRTU=;
 b=fxdqCUg/Da8kL6conIFH5/i0f5sPr9yz8OZkI7C6T9TVz98F+ocgqfQsuIlVUBjSlg
 JJRnCka7GiRSePHEqiGoV131Ai0fbSoWJCAmdklnHdR13SgKjX62UTpUTwx3nlE+iRTO
 p8rJkTbK6mBhD9WAEKmj+8h/dX95UCU7LJSGxtIW3+3AGEfYXgAklL+ecglExEl+AuEY
 WFzmGMhV/Q0C8/uimYJre8xf484XqpsQJ4Rj8KqkS2i52HDjahHNRwUrEoZPCLT+nPrB
 k1+IMBxyudTvUEDlE2OGBbnKe1b9vuA5DGczTFVbQPXnRUTbJisvRgOomQtLXCuVwuCL
 1vQQ==
X-Gm-Message-State: AJIora+R+jPrYQr8EDGGDM/Io3smOwxXfundxOUxf0ZA5xW9Xj1jjh+j
 rHJZFj3sVbnUAwES0jmW15PFoiOGUXj88IN8qpcY2L4pa9xO+LZMREVC3Hva5KVN7N2yYiZe90R
 FFU8QMHXpoWFr5a5+rJJfzRbFDxfA6tVICwiovQ==
X-Received: by 2002:adf:e19e:0:b0:211:7169:dfa6 with SMTP id
 az30-20020adfe19e000000b002117169dfa6mr24048930wrb.654.1655745642551; 
 Mon, 20 Jun 2022 10:20:42 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tFaA2A/tMcSx28aoIwzaJ/1zyUh/x8dRvyrc0NIjxzoKnQZprW2QKh8Xd4AtoM5/MQdg8z9TTmefAXwE9ZbYg=
X-Received: by 2002:adf:e19e:0:b0:211:7169:dfa6 with SMTP id
 az30-20020adfe19e000000b002117169dfa6mr24048911wrb.654.1655745642348; Mon, 20
 Jun 2022 10:20:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220619070559.GA27401@lst.de>
 <Yq8TShTaJ6xn6Koi@casper.infradead.org>
 <20220620062147.GB10640@lst.de>
In-Reply-To: <20220620062147.GB10640@lst.de>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 20 Jun 2022 19:20:31 +0200
Message-ID: <CAHc6FU6ZR-__zS52UoSEZoqFyoTuKXroAK7GjPmBZdLPshfEXA@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: Re: [Cluster-devel] gfs2 is unhappy on pagecache/for-next
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
Cc: cluster-devel <cluster-devel@redhat.com>,
 Matthew Wilcox <willy@infradead.org>, Linux-MM <linux-mm@kvack.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 20, 2022 at 8:21 AM Christoph Hellwig <hch@lst.de> wrote:
> On Sun, Jun 19, 2022 at 01:15:06PM +0100, Matthew Wilcox wrote:
> > On Sun, Jun 19, 2022 at 09:05:59AM +0200, Christoph Hellwig wrote:
> > > When trying to run xfstests on gfs2 (locally with the lock_nolock
> > > cluster managed) the first mount already hits this warning in
> > > inode_to_wb called from mark_buffer_dirty.  This all seems standard
> > > code from folio_account_dirtied, so not sure what is going there.
> >
> > I don't think this is new to pagecache/for-next.
> > https://lore.kernel.org/linux-mm/cf8bc8dd-8e16-3590-a714-51203e6f4ba9@redhat.com/
>
> Indeed, I can reproduce this on mainline as well.  I just didn't
> expect a maintained file system to blow up on the very first mount
> in xfstests..

Yes, I'm aware of this. For all I know, we've been having this issue
since Tejun added this warning in 2015 in commit aaa2cacf8184
("writeback: add lockdep annotation to inode_to_wb()"), and I don't
know what to do about it. The only way of building a working version
of gfs2 currently is without CONFIG_LOCKDEP, or by removing that
warning.

My best guess is that it has to do with how gfs2 uses address spaces:
we have two address spaces attached to each inode: one for the inode's
data, and one for the inode's metadata. The "normal" data address
space works as it does on other filesystems. The metadata address
space is used to flush and purge ("truncate") an inode's metadata from
memory so that we can allow other cluster nodes to modify that inode.
The metadata can be spread out over the whole disk, but we want to
flush it in some sensible order; the address space allows that.

We've switched to that setup in commit 009d851837ab ("GFS2: Metadata
address space clean up") in 2009. Back then, each resource group also
had its own address space, but that was merged into a single address
space in commit 70d4ee94b370 (sd_aspace, "GFS2: Use only a single
address space for rgrps"). But then last year, Jan Kara basically said
that this has never worked and was never going to work [1]. More
recently, Willy pointed us at a similar looking fix in nilfs [2]. If I
understand that fix correctly, it would put us back into the state
before commit 009d851837ab ("GFS2: Metadata address space clean up"),
wasting an entire struct inode for each gfs2 inode for basically
nothing. Or maybe I'm just misunderstanding this whole crap.

Thanks,
Andreas

[1] Jan Kara on July 28, 2021:
https://listman.redhat.com/archives/cluster-devel/2021-July/021300.html

[2] Matthew Willcox on May 22, 2022:
https://lore.kernel.org/lkml/YorDHW5UmHuTq+2c@casper.infradead.org/

