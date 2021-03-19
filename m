Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 63BDC341D0C
	for <lists+cluster-devel@lfdr.de>; Fri, 19 Mar 2021 13:40:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616157622;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FUBqH4G0q4qbOF2uf+vFplmnBndARvslvxuccnBq2Sk=;
	b=G2fZli504ht2JM0sZSveSGtGbJm9tPfIpfJ/oD6RGRb3aVoW4xGtyS4wftI/wELkhb61Ma
	9V8f0CkuDs8nXX+e+UoAPwkXMTQGuKKHPX9iajrr3HRMKw1rt0ujGSIOWi9ZsHrZMY1voF
	qA9KlUdWsqx7oHUskhZ66N5S7VRACtY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-5HdxvOnkMduXD0eY3YjRIQ-1; Fri, 19 Mar 2021 08:40:20 -0400
X-MC-Unique: 5HdxvOnkMduXD0eY3YjRIQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DAA0F1926DA4;
	Fri, 19 Mar 2021 12:40:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 854435C1BB;
	Fri, 19 Mar 2021 12:40:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 361B44BB7C;
	Fri, 19 Mar 2021 12:40:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12JCeENG011454 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 19 Mar 2021 08:40:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EC3421A86F; Fri, 19 Mar 2021 12:40:14 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E49E819C79;
	Fri, 19 Mar 2021 12:40:11 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B980F1809C81;
	Fri, 19 Mar 2021 12:40:11 +0000 (UTC)
Date: Fri, 19 Mar 2021 08:40:09 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: Steven Whitehouse <swhiteho@redhat.com>
Message-ID: <797909222.64763856.1616157609288.JavaMail.zimbra@redhat.com>
In-Reply-To: <31cdea6d-6926-6f87-f8ab-6594a4a9e7c6@redhat.com>
References: <720686359.64750132.1616155577098.JavaMail.zimbra@redhat.com>
	<31cdea6d-6926-6f87-f8ab-6594a4a9e7c6@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.112.96, 10.4.195.22]
Thread-Topic: gfs2: Add new sysfs file for gfs2 status
Thread-Index: /k91HQsuRbFtANXT8PmjdOTpvgCkGQ==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH] gfs2: Add new sysfs file for gfs2
 status
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi,

----- Original Message -----
> On 19/03/2021 12:06, Bob Peterson wrote:
> > This patch adds a new file: /sys/fs/gfs2/*/status which will report
> > the status of the file system. Catting this file dumps the current
> > status of the file system according to various superblock variables.
> > For example:
> 
> It looks like it might be missing some locking on some of those variables?
> 
> Steve.

Yes that's true, but the absence of locking is by design.

The new sysfs file is only for debugging purposes, mostly to help us
debug livelocks and deadlocks. But in deadlock situations, it's quite
likely you won't be able to acquire the proper locks. Hopefully this new
file may be captured by sos reports at some point, or checked by insights
rules, and we can't have those things deadlocking.

The way I see it, it's better to get possibly inaccurate values than to
have your access of the sysfs file deadlock itself. Partial information is
better than no information, if you see what I mean. At least we can tell
if things are still changing and the status of the locks, and such.

In previous incarnations of this patch, I dumped the ail lists, which is
also valuable, but to do that, we absolutely need the locking to ensure
we don't access freed memory and such. This version avoids all that
possibility, so the locking isn't as important. Unless, of course, I'm
failing to take something into account.

Regards,

Bob Peterson

