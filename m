Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AAF7121DB
	for <lists+cluster-devel@lfdr.de>; Fri, 26 May 2023 10:11:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685088660;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=suhlTCSdjkwwCawJJF8xodaRhqnhkhv/03FtDn0nrOI=;
	b=DauhONmUxezPNdiDeZBdOLzYzsiGxJr8GU6AInI2smLRKiKIDN0yfJdW0UZ54Y3WVR2qsS
	lo6jsUqf4EGBynykSN2kYo2jfxixCWPk+CemyG0RYj0Dv5ogcvCEisbxM0msxHx2mj2Ne0
	w17H0uJBov+XI9TNEeKiko1slQV59UU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-YXWzs36OO-uh6BCtS8A9Ow-1; Fri, 26 May 2023 04:10:53 -0400
X-MC-Unique: YXWzs36OO-uh6BCtS8A9Ow-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F67D3C00135;
	Fri, 26 May 2023 08:10:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 33B08407DEC3;
	Fri, 26 May 2023 08:10:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 43FD719465B1;
	Fri, 26 May 2023 08:10:49 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 99BC419465A0 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 26 May 2023 08:10:48 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7E5551121315; Fri, 26 May 2023 08:10:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 772751121314
 for <cluster-devel@redhat.com>; Fri, 26 May 2023 08:10:48 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 17B6929A9D35
 for <cluster-devel@redhat.com>; Fri, 26 May 2023 08:10:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-601-kSbKODDbO_aNnlka527k5g-1; Fri, 26 May 2023 04:10:46 -0400
X-MC-Unique: kSbKODDbO_aNnlka527k5g-1
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1q2SX5-001YtL-2n; Fri, 26 May 2023 08:10:43 +0000
Date: Fri, 26 May 2023 01:10:43 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Kent Overstreet <kent.overstreet@linux.dev>
Message-ID: <ZHBpg4ndZ2CLP7mi@infradead.org>
References: <20230509165657.1735798-1-kent.overstreet@linux.dev>
 <20230509165657.1735798-7-kent.overstreet@linux.dev>
 <20230510010737.heniyuxazlprrbd6@quack3>
 <ZFs3RYgdCeKjxYCw@moria.home.lan>
 <20230523133431.wwrkjtptu6vqqh5e@quack3>
 <ZGzoJLCRLk+pCKAk@infradead.org>
 <CAHpGcML0CZ1RGkOf26iYt_tK0Ux=cfdW8d3bjMVbjXLr91cs+g@mail.gmail.com>
 <ZG/tTorh8G2919Jz@moria.home.lan>
MIME-Version: 1.0
In-Reply-To: <ZG/tTorh8G2919Jz@moria.home.lan>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [Cluster-devel] [PATCH 06/32] sched: Add
 task_struct->faults_disabled_mapping
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
Cc: cluster-devel@redhat.com, dhowells@redhat.com, Jan Kara <jack@suse.cz>,
 "Darrick J . Wong" <djwong@kernel.org>,
 Andreas =?iso-8859-1?Q?Gr=FCnbacher?= <andreas.gruenbacher@gmail.com>,
 linux-kernel@vger.kernel.org, linux-bcachefs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Kent Overstreet <kent.overstreet@gmail.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: infradead.org
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 25, 2023 at 07:20:46PM -0400, Kent Overstreet wrote:
> > > I'm absolutely not in favour to add workarounds for thes kind of locking
> > > problems to the core kernel.  I already feel bad for allowing the
> > > small workaround in iomap for btrfs, as just fixing the locking back
> > > then would have avoid massive ratholing.
> > 
> > Please let me know when those btrfs changes are in a presentable shape ...
> 
> I would also be curious to know what btrfs needs and what the approach
> is there.

btrfs has the extent locked, where "extent locked" is a somewhat magic
range lock that actually includes different lock bits.  It does so
because it clears the page writeback bit when the data made it to the
media, but before the metadata required to find it is commited, and
the extent lock prevents it from trying to do a readpage on something
that has actually very recently been written back but not fully
commited.  Once btrfs is changed to only clear the page writeback bit
once the write is fully commited like in other file systems this extra
level of locking can go away, and there are no more locks in the
readpage path that are also taken by the direct I/O code.  With that
a lot of code in btrfs working around this can go away, including the
no fault direct I/O code.

