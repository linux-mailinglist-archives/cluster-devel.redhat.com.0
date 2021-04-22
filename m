Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9C934368445
	for <lists+cluster-devel@lfdr.de>; Thu, 22 Apr 2021 17:57:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1619107052;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=OGHy82+gto2AO5Ep+ShIhd82dBgiJ2G1PxOBjaM/zQ0=;
	b=iDfh9iQJEynhHHbFHszYf9ONLB9rYEZQ75spyCY6kGhfZZ0jUYs9CubbH89qbk9EnNmBKg
	4ECr7Nlrs3yUnNJioXMC+cbmk9WXFxvylFxwEwOGAXGV05oXwilo//HTBQspOxS3ZeTjcG
	gLdhsk6CM/7fo7HqX4IyDnnvLF5yafQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-Kr5U2hZuPTm3zQvBL--OJQ-1; Thu, 22 Apr 2021 11:57:30 -0400
X-MC-Unique: Kr5U2hZuPTm3zQvBL--OJQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0829684B9A9;
	Thu, 22 Apr 2021 15:57:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E4B6619C45;
	Thu, 22 Apr 2021 15:57:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 77FBB1809C82;
	Thu, 22 Apr 2021 15:57:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13MFvInJ005641 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 22 Apr 2021 11:57:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E82705DEAD; Thu, 22 Apr 2021 15:57:18 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D36585DDAD;
	Thu, 22 Apr 2021 15:57:14 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CAE7E1809C82;
	Thu, 22 Apr 2021 15:57:14 +0000 (UTC)
Date: Thu, 22 Apr 2021 11:57:14 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: Jan Kara <jack@suse.cz>
Message-ID: <619588401.12709186.1619107034528.JavaMail.zimbra@redhat.com>
In-Reply-To: <20210422131419.GI26221@quack2.suse.cz>
References: <20210422112612.GF26221@quack2.suse.cz>
	<CAHc6FU7kFWtQDAAU16h3xkWkSV2dm9WWb-RbjXBusJ9+118GRw@mail.gmail.com>
	<20210422131419.GI26221@quack2.suse.cz>
MIME-Version: 1.0
X-Originating-IP: [10.3.112.47, 10.4.195.8]
Thread-Topic: Hole punch races in GFS2
Thread-Index: T6wyLmaHzfJUXIjdoH0MOoOv7kxfyA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] Hole punch races in GFS2
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

----- Original Message -----
> OK, thanks for explanation! I missed that GFS2 glocks are task local. But
> then I have another question. We have the following:
> 
> gfs2_file_read_iter()
>   grabs inode glock in shared mode
>   generic_file_read_iter()
>     filemap_read()
>       copy_page_to_iter()
>         <page fault>
>         grabs mmap_sem
>           gfs2_fault()
>             - tries to grab inode glock again -> possible recursive locking
> 
> And even if the locking isn't recursive, you have glock->mmap_sem and
> mmap_sem->glock lock orderings so ABBA deadlocks are possible AFAICT.
> 
> And there's a similar problem with the write path as well, just the lock is
> grabbed exclusively.
> 
> 								Honza
> --
> Jan Kara <jack@suse.com>
> SUSE Labs, CR

Hi Jan,

IIRC, gfs2 tries to prevent the page fault by having gfs2_file_read_iter
call into generic_file_read_iter twice:

The first time without the glock held, but specifying IOCB_NOIO, which
brings the pages in and returns -EAGAIN. Then it acquires the glock,
then calls into generic_file_read_iter a second time.

I'm not sure if that prevents the deadlock or just makes it less likely.
I still need to investigate that.

Regards,

Bob Peterson
Red Hat File Systems

