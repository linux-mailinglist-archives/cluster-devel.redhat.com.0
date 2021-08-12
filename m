Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 18D8C3EA9BC
	for <lists+cluster-devel@lfdr.de>; Thu, 12 Aug 2021 19:47:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1628790456;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=zRsd1Ra8dJUbEpJ6TDKFzo8PoKvrGWdvjHgl1kLFYVA=;
	b=F/EXK/Kx3eFUAwiSddxv33vQwE5/gYDu8P7AMBBlE9P1peeHrjoWvuAARsjkLyn4jgtRb9
	vKjSlwKEPXvwPXyhIAlrVJWhizRHtYMSpnLTxOOAskyBcYgwLBwKogDoR+yKnAh+4WEyma
	TPnpP8QNWUJLIefY1cSH1GVt/6S5B1g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-z8XUXwmHNfO9xU83GJHGmg-1; Thu, 12 Aug 2021 13:47:34 -0400
X-MC-Unique: z8XUXwmHNfO9xU83GJHGmg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D928787D542;
	Thu, 12 Aug 2021 17:47:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 34E4A5D9C6;
	Thu, 12 Aug 2021 17:47:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 73E6B4BB7C;
	Thu, 12 Aug 2021 17:47:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17CHjWme031735 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 12 Aug 2021 13:45:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5EAA25DA61; Thu, 12 Aug 2021 17:45:32 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from redhat.com (unknown [10.15.80.136])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4ABE55D9C6;
	Thu, 12 Aug 2021 17:45:25 +0000 (UTC)
Date: Thu, 12 Aug 2021 12:45:23 -0500
From: David Teigland <teigland@redhat.com>
To: Gang He <ghe@suse.com>
Message-ID: <20210812174523.GC1757@redhat.com>
References: <AM6PR04MB6488E4D6F12BFB4B91BE9E45CFF89@AM6PR04MB6488.eurprd04.prod.outlook.com>
	<CAK-6q+hXb=hBHHgS94M94aS7JCeCuUrwVH=05oJoxt3tFatDyw@mail.gmail.com>
	<74009531-f6ef-4ef9-b969-353684006ddc@suse.com>
MIME-Version: 1.0
In-Reply-To: <74009531-f6ef-4ef9-b969-353684006ddc@suse.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] Why does dlm_lock function fails when
 downconvert a dlm lock?
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 12, 2021 at 01:44:53PM +0800, Gang He wrote:
> In fact, I can reproduce this problem stably.
> I want to know if this error happen is by our expectation? since there is
> not any extreme pressure test.
> Second, how should we handle these error cases? call dlm_lock function
> again? maybe the function will fails again, that will lead to kernel
> soft-lockup after multiple re-tries.

What's probably happening is that ocfs2 calls dlm_unlock(CANCEL) to cancel
an in-progress dlm_lock() request.  Before the cancel completes (or the
original request completes), ocfs2 calls dlm_lock() again on the same
resource.  This dlm_lock() returns -EBUSY because the previous request has
not completed, either normally or by cancellation.  This is expected.

A couple options to try: wait for the original request to complete
(normally or by cancellation) before calling dlm_lock() again, or retry
dlm_lock() on -EBUSY.

Dave

