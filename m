Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 430DD3D8841
	for <lists+cluster-devel@lfdr.de>; Wed, 28 Jul 2021 08:51:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1627455078;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=wetm5cP9RW761OINfBCGV/ayzDK0ZkyQZu3q9PZFPho=;
	b=hN7hw6nodBQ7GBDEmRwqiZ3fcfiJUecC19QFSmS7SKvXFunK51cZQmbP30AjrECJXdjdZb
	7MJLo8xNeqUvKe3Aay9IYj2/ouI8FMo7MRSH+nbqVUZ+odJFEZdAItWKbkBu1yqAjii6El
	PTu/Y47niu3XqwD6GGMA0f5qtH4i2+w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-Cbb2ZEonNOSw1g5EXKHLnQ-1; Wed, 28 Jul 2021 02:51:17 -0400
X-MC-Unique: Cbb2ZEonNOSw1g5EXKHLnQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B0248010F4;
	Wed, 28 Jul 2021 06:51:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DE4736E0B9;
	Wed, 28 Jul 2021 06:51:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A98E04A7C8;
	Wed, 28 Jul 2021 06:51:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16S6p5kU003321 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 28 Jul 2021 02:51:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BB193112D412; Wed, 28 Jul 2021 06:51:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B11F0112D436
	for <cluster-devel@redhat.com>; Wed, 28 Jul 2021 06:51:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 09291800BED
	for <cluster-devel@redhat.com>; Wed, 28 Jul 2021 06:51:03 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
	[209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-486-RnhmREJ2Nj-VeRA-0qIIEw-1; Wed, 28 Jul 2021 02:51:01 -0400
X-MC-Unique: RnhmREJ2Nj-VeRA-0qIIEw-1
Received: by mail-wr1-f69.google.com with SMTP id
	s22-20020adf97960000b02901535eae4100so517197wrb.14
	for <cluster-devel@redhat.com>; Tue, 27 Jul 2021 23:51:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wetm5cP9RW761OINfBCGV/ayzDK0ZkyQZu3q9PZFPho=;
	b=oRHQA9Yi/jtYSoOSxfapRUct3nvED8VrKE7GkQkvmZwUtsaB4tTUbRsOACunG3zRaF
	vKr8c7TxpwVtvZWBaiyMQ+C0UQdP3USnYbwVpZpv1HFOwhhHciP3PQRupx3ZCm63Bks1
	G3p0hULnorLaBnIg244In+lTMMEWCb4aUmRtA2TKs5uNwdCSEXG88WiV/vw/pvl+pOTC
	saJRk5LPkB9czxNTaHD7gwPHOLStvottTkMen1iK7+3t+HMvxh7ljYptnFZAZINqqFEf
	bvrWeiKL+nYh3G+5620UZTiIRL1jkXdEZyfCEmrmTjIDz0lxZW5cQhEKlEmhcMytVnof
	OvyA==
X-Gm-Message-State: AOAM533jCmxbCsnVdb5Q9ddYp2WJwnjIexrnQWIsTCLcMyTLBGOhUlc/
	8oxcwO9zl6lEfu1g2zF/AenQYJNmiwzTpVrCt/3k8iBnD9jQIOKJVLpsdb5Ro8HfreREzRoysJE
	/idUqHOCq9zg74XPc6mBVpB1F+zD+es7n2KzrUQ==
X-Received: by 2002:a5d:5286:: with SMTP id c6mr25764568wrv.357.1627455059923; 
	Tue, 27 Jul 2021 23:50:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSpt2WGXdseNO0i+nUl/tkOM3ZQwKa6Kada8BqTy3ECu+EyG7iUQDgpZ17MMrMaavJsnbhNSJ4XI2j8cAy+f8=
X-Received: by 2002:a5d:5286:: with SMTP id c6mr25764553wrv.357.1627455059741; 
	Tue, 27 Jul 2021 23:50:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210713180958.66995-1-rpeterso@redhat.com>
	<20210713180958.66995-11-rpeterso@redhat.com>
	<34e7b795c97d781b8788d965dd7caf48d8b8ec24.camel@redhat.com>
	<76779e30-76b3-b867-7d1c-46a96b56a741@redhat.com>
In-Reply-To: <76779e30-76b3-b867-7d1c-46a96b56a741@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 28 Jul 2021 08:50:47 +0200
Message-ID: <CAHc6FU6NNG3M8ewuehy50G4PVJ7v_aWgoUpZfNitJSzU1ajzdA@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>, Jan Kara <jack@suse.cz>,
	Matthew Wilcox <willy@infradead.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH 10/10] gfs2: replace sd_aspace with
	sd_inode
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 13, 2021 at 9:34 PM Bob Peterson <rpeterso@redhat.com> wrote:
> On 7/13/21 1:26 PM, Steven Whitehouse wrote:
>
> Hi,
>
> On Tue, 2021-07-13 at 13:09 -0500, Bob Peterson wrote:
>
> Before this patch, gfs2 kept its own address space for rgrps, but
> this
> caused a lockdep problem because vfs assumes a 1:1 relationship
> between
> address spaces and their inode. One problematic area is this:
>
> I don't think that is the case. The reason that the address space is a
> separate structure in the first place is to allow them to exist without
> an inode. Maybe that has changed, but we should see why that is, in
> that case rather than just making this change immediately.
>
> I can't see any reason why if we have to have an inode here that it
> needs to be hashed... what would need to look it up via the hashes?
>
> Steve.
>
> Hi,
>
> The actual use case, which is easily demonstrated with lockdep, is given
> in the patch text shortly after where you placed your comment. This goes
> back to this discussion from April 2018:
>
> https://listman.redhat.com/archives/cluster-devel/2018-April/msg00017.html
>
> in which Jan Kara pointed out that:
>
> "The problem is we really do expect mapping->host->i_mapping == mapping as
> we pass mapping and inode interchangeably in the mm code. The address_space
> and inodes are separate structures because you can have many inodes
> pointing to one address space (block devices). However it is not allowed
> for several address_spaces to point to one inode!"

This is fundamentally at adds with how we manage inodes: we have
inode->i_mapping which is the logical address space of the inode, and
we have gfs2_glock2aspace(GFS2_I(inode)->i_gl) which is the metadata
address space of the inode. The most important function of the
metadata address space is to remove the inode's metadata from memory
by truncating the metadata address space (inode_go_inval). We need
that when moving an inode to another node. I don't have the faintest
idea how we could otherwise achieve that in a somewhat efficient way.

Thanks,
Andreas

