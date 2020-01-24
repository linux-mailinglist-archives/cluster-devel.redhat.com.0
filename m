Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 6B000148652
	for <lists+cluster-devel@lfdr.de>; Fri, 24 Jan 2020 14:46:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579873576;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TX9C3c+YbFon3vAwII+YKQqbi7romZ1hkJJgHfF1n5Q=;
	b=N25BDnWGJ8AojdSdVMZXmdcw52/5YvJfyoa3h+VTcc3d/USo8Bp15vgHbSP9HcfTRbnCqq
	Kxyxxe9AVAJR8cFMIOWzLD1Qtj/NWK05JxeED0/1kTRKpq4sHHOR/V5qnc6jcE+w7wQ5z/
	mFybrgZwGtZAQZYdvYNai+h4vUWcxtk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-56-3LueR7wQNqyHEBNL_TNKJg-1; Fri, 24 Jan 2020 08:46:13 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E12208017CC;
	Fri, 24 Jan 2020 13:46:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 64CFA60BEC;
	Fri, 24 Jan 2020 13:46:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CE0B618089C8;
	Fri, 24 Jan 2020 13:46:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00ODk0ul003467 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 24 Jan 2020 08:46:00 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 331B91084194; Fri, 24 Jan 2020 13:46:00 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B6DDD1084192;
	Fri, 24 Jan 2020 13:45:57 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A962585947;
	Fri, 24 Jan 2020 13:45:57 +0000 (UTC)
Date: Fri, 24 Jan 2020 08:45:57 -0500 (EST)
From: Bob Peterson <rpeterso@redhat.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <1920225263.4672289.1579873557442.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAHc6FU6vgpMs1pO1t4odWNq_J+Cxdck+E+S=zRhFGwYL=Qu6aQ@mail.gmail.com>
References: <20191209153700.700208-1-rpeterso@redhat.com>
	<20191209153700.700208-17-rpeterso@redhat.com>
	<CAHc6FU6vgpMs1pO1t4odWNq_J+Cxdck+E+S=zRhFGwYL=Qu6aQ@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.116.64, 10.4.195.27]
Thread-Topic: gfs2: new slab for transactions
Thread-Index: HxfyT7zHWZG8ZKKW8GI88ode9cp8KA==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 v8 PATCH 16/22] gfs2: new slab for
 transactions
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: 3LueR7wQNqyHEBNL_TNKJg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

----- Original Message -----
> On Mon, Dec 9, 2019 at 4:38 PM Bob Peterson <rpeterso@redhat.com> wrote:
> > This patch adds a new slab for gfs2 transactions. That allows us to
> > have an initialization function and protect against some errors.
> 
> The added checks in gfs2_trans_free actually have nothing to do with

Hi,

I agree that a lot of these extra checks are unnecessary, especially
with the amount of testing this patch has had. My main concern was that
some transactions are often moved from the caller to a global pointer
queued off the superblock, sdp. Bear in mind I also used this patch
as part of a larger effort to try to locate use-after-free slab corruption
problems people were seeing in the kernel. These checks proved those
problems were not caused by GFS2 transactions being used after they were
freed, so we can probably remove them.

Before the patch, new transactions were allocated with kzalloc, which
meant the storage was guaranteed to be initialized to all zeroes.
Now that we're using a slab, I wanted to similarly guarantee there
weren't any leftover values left in the slab objects.

Also bear in mind this really has nothing to do with the recovery and
journal replay problems, so this patch could be pushed separately, and
I think it would be a good idea.

I'll clean this up a bit and send a replacement outside the patch set.

Regards,

Bob Peterson
Red Hat File Systems

