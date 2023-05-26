Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 65731712264
	for <lists+cluster-devel@lfdr.de>; Fri, 26 May 2023 10:38:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685090338;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=yHu4Pz64nDZSjcqDec3QpKXS1/Ocd0ra+J22ys59U50=;
	b=SCj2mmwVRLGRlKnY4qAZvjxnfjrwKmzDk6lA0OMIX1m2ya09+/lAHLPNF1MAjVu/oR2WWW
	xRPlcS6lv0JE/8ttWQXnEix6i++NvWwMq+sn/GrQlJp1zseGYaiiG3li+gheXDJb6c9B6R
	0XtwsTyqA1Lte7aoIkdGYARUlTEF8gY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-37-Cdi07A52PeewtbIQcm584Q-1; Fri, 26 May 2023 04:38:55 -0400
X-MC-Unique: Cdi07A52PeewtbIQcm584Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4FEF18032EF;
	Fri, 26 May 2023 08:38:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 44710140E961;
	Fri, 26 May 2023 08:38:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DA64C19465B1;
	Fri, 26 May 2023 08:38:53 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E451919465A0 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 26 May 2023 08:38:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D39F4C154D1; Fri, 26 May 2023 08:38:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CC1C5C15612
 for <cluster-devel@redhat.com>; Fri, 26 May 2023 08:38:52 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A7700185A792
 for <cluster-devel@redhat.com>; Fri, 26 May 2023 08:38:52 +0000 (UTC)
Received: from out-31.mta1.migadu.com (out-31.mta1.migadu.com
 [95.215.58.31]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-124-MDpijhBtN1yhXyhvazsQ8A-1; Fri, 26 May 2023 04:38:50 -0400
X-MC-Unique: MDpijhBtN1yhXyhvazsQ8A-1
Date: Fri, 26 May 2023 04:38:41 -0400
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <ZHBwEYupK2gxLOjn@moria.home.lan>
References: <20230509165657.1735798-1-kent.overstreet@linux.dev>
 <20230509165657.1735798-7-kent.overstreet@linux.dev>
 <20230510010737.heniyuxazlprrbd6@quack3>
 <ZFs3RYgdCeKjxYCw@moria.home.lan>
 <20230523133431.wwrkjtptu6vqqh5e@quack3>
 <ZGzoJLCRLk+pCKAk@infradead.org>
 <CAHpGcML0CZ1RGkOf26iYt_tK0Ux=cfdW8d3bjMVbjXLr91cs+g@mail.gmail.com>
 <ZG/tTorh8G2919Jz@moria.home.lan> <ZHBpg4ndZ2CLP7mi@infradead.org>
MIME-Version: 1.0
In-Reply-To: <ZHBpg4ndZ2CLP7mi@infradead.org>
X-Migadu-Flow: FLOW_OUT
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
Cc: dhowells@redhat.com, Jan Kara <jack@suse.cz>,
 "Darrick J . Wong" <djwong@kernel.org>,
 Andreas =?utf-8?Q?Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>,
 linux-kernel@vger.kernel.org, cluster-devel@redhat.com,
 linux-bcachefs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Kent Overstreet <kent.overstreet@gmail.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.dev
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 26, 2023 at 01:10:43AM -0700, Christoph Hellwig wrote:
> On Thu, May 25, 2023 at 07:20:46PM -0400, Kent Overstreet wrote:
> > > > I'm absolutely not in favour to add workarounds for thes kind of locking
> > > > problems to the core kernel.  I already feel bad for allowing the
> > > > small workaround in iomap for btrfs, as just fixing the locking back
> > > > then would have avoid massive ratholing.
> > > 
> > > Please let me know when those btrfs changes are in a presentable shape ...
> > 
> > I would also be curious to know what btrfs needs and what the approach
> > is there.
> 
> btrfs has the extent locked, where "extent locked" is a somewhat magic
> range lock that actually includes different lock bits.  It does so
> because it clears the page writeback bit when the data made it to the
> media, but before the metadata required to find it is commited, and
> the extent lock prevents it from trying to do a readpage on something
> that has actually very recently been written back but not fully
> commited.  Once btrfs is changed to only clear the page writeback bit
> once the write is fully commited like in other file systems this extra
> level of locking can go away, and there are no more locks in the
> readpage path that are also taken by the direct I/O code.  With that
> a lot of code in btrfs working around this can go away, including the
> no fault direct I/O code.

wow, yeah, that is not how that is supposed to work...

