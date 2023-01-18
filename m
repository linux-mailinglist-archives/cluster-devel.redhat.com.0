Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 459CB6727CA
	for <lists+cluster-devel@lfdr.de>; Wed, 18 Jan 2023 20:04:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674068666;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=WSX9nePDSqolBCrzAZCG6P2bLgUQtHUt2aksMWy1z1M=;
	b=W0LxVORwAu43MPZ1iTloYr5pS1CLaVeEGsy/0HsWz2MSm08rpwWzMyfcqErkL2JPtcKQs/
	JaNahn4C9BCoCkD/U39QfIQZzl6iUgoIKZgobg+5CMFjbnHDSFPRXHTTBU1FzWrdXPmpri
	z3JEDOq/YxEaR/WM/VFZDgEBU/6pPzk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-338-9n5SJu8nOR6Kgbk_2Ps2TA-1; Wed, 18 Jan 2023 14:04:21 -0500
X-MC-Unique: 9n5SJu8nOR6Kgbk_2Ps2TA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD6A187A9EE;
	Wed, 18 Jan 2023 19:04:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DDA25140EBF5;
	Wed, 18 Jan 2023 19:04:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A31181946A6E;
	Wed, 18 Jan 2023 19:04:19 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7E36A1946A45 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 18 Jan 2023 19:04:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 47558C15BAE; Wed, 18 Jan 2023 19:04:18 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 40645C15BAD
 for <cluster-devel@redhat.com>; Wed, 18 Jan 2023 19:04:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 23C77801779
 for <cluster-devel@redhat.com>; Wed, 18 Jan 2023 19:04:18 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-aj4HTBmdObeNeFNEEY0JuQ-1; Wed, 18 Jan 2023 14:04:14 -0500
X-MC-Unique: aj4HTBmdObeNeFNEEY0JuQ-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CC3AE6199D;
 Wed, 18 Jan 2023 19:04:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36B06C433EF;
 Wed, 18 Jan 2023 19:04:12 +0000 (UTC)
Date: Wed, 18 Jan 2023 11:04:11 -0800
From: "Darrick J. Wong" <djwong@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <Y8hCq+fIWgHfUufe@magnolia>
References: <20230108194034.1444764-1-agruenba@redhat.com>
 <20230108194034.1444764-9-agruenba@redhat.com>
 <20230108215911.GP1971568@dread.disaster.area>
 <CAHc6FU4z1nC8zdM8NvUyMqU29_J7_oNu1pvBHuOvR+M6gq7F0Q@mail.gmail.com>
 <20230109225453.GQ1971568@dread.disaster.area>
 <CAHpGcM+urV5LYpTZQWTRoK6VWaLx0sxk3mDe_kd3VznMY9woVw@mail.gmail.com>
 <Y8Q4FmhYehpQPZ3Z@magnolia> <Y8eeAmm1Vutq3Fc9@infradead.org>
MIME-Version: 1.0
In-Reply-To: <Y8eeAmm1Vutq3Fc9@infradead.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [Cluster-devel] [RFC v6 08/10] iomap/xfs: Eliminate the
 iomap_valid handler
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
Cc: cluster-devel@redhat.com, Damien Le Moal <damien.lemoal@wdc.com>,
 Andreas =?iso-8859-1?Q?Gr=FCnbacher?= <andreas.gruenbacher@gmail.com>,
 Dave Chinner <david@fromorbit.com>, Matthew Wilcox <willy@infradead.org>,
 linux-xfs@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 17, 2023 at 11:21:38PM -0800, Christoph Hellwig wrote:
> On Sun, Jan 15, 2023 at 09:29:58AM -0800, Darrick J. Wong wrote:
> > I don't have any objections to pulling everything except patches 8 and
> > 10 for testing this week. 
> 
> That would be great.  I now have a series to return the ERR_PTR
> from __filemap_get_folio which will cause a minor conflict, but
> I think that's easy enough for Linux to handle.

Ok, done.

> > 
> > 1. Does zonefs need to revalidate mappings?  The mappings are 1:1 so I
> > don't think it does, but OTOH zone pointer management might complicate
> > that.
> 
> Adding Damien.
> 
> > 2. How about porting the writeback iomap validation to use this
> > mechanism?  (I suspect Dave might already be working on this...)
> 
> What is "this mechanism"?  Do you mean the here removed ->iomap_valid
> ?   writeback calls into ->map_blocks for every block while under the
> folio lock, so the validation can (and for XFS currently is) done
> in that.  Moving it out into a separate method with extra indirect
> functiona call overhead and interactions between the methods seems
> like a retrograde step to me.

Sorry, I should've been more specific -- can xfs writeback use the
validity cookie in struct iomap and thereby get rid of struct
xfs_writepage_ctx entirely?

> > 2. Do we need to revalidate mappings for directio writes?  I think the
> > answer is no (for xfs) because the ->iomap_begin call will allocate
> > whatever blocks are needed and truncate/punch/reflink block on the
> > iolock while the directio writes are pending, so you'll never end up
> > with a stale mapping.
> 
> Yes.

Er... yes as in "Yes, we *do* need to revalidate directio writes", or
"Yes, your reasoning is correct"?

--D

