Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id BF56D3ED920
	for <lists+cluster-devel@lfdr.de>; Mon, 16 Aug 2021 16:46:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629125184;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=g94AY7FcJ9x9m8X0T2PYAcZ5TmO9bwFd1yApgy60bRA=;
	b=hp8MhSCmpZJ0/36cNl8o78XqAYmrMEOqT20+DfOZ88SH15ml6ZYLxcpOVMK5pkeIcN79Ca
	VKPx+zAGOxC3279edmbo8vOthlrT3+4LkcP2UNtNl9nda48uAr9RmcEEu8McgcIkeqweA4
	kCT5ncVPC7hD2Km6shQADstnjpv0Nfk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-U7jqIYWHNZaZM55Vnoir2Q-1; Mon, 16 Aug 2021 10:46:23 -0400
X-MC-Unique: U7jqIYWHNZaZM55Vnoir2Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C1401018F70;
	Mon, 16 Aug 2021 14:46:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1AF025C1D5;
	Mon, 16 Aug 2021 14:46:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5D2454BB7C;
	Mon, 16 Aug 2021 14:46:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17GEfNG7017387 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 16 Aug 2021 10:41:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A49F360871; Mon, 16 Aug 2021 14:41:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from redhat.com (unknown [10.15.80.136])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F10DE60861;
	Mon, 16 Aug 2021 14:41:19 +0000 (UTC)
Date: Mon, 16 Aug 2021 09:41:18 -0500
From: David Teigland <teigland@redhat.com>
To: Gang He <ghe@suse.com>
Message-ID: <20210816144118.GB23630@redhat.com>
References: <AM6PR04MB6488E4D6F12BFB4B91BE9E45CFF89@AM6PR04MB6488.eurprd04.prod.outlook.com>
	<CAK-6q+hXb=hBHHgS94M94aS7JCeCuUrwVH=05oJoxt3tFatDyw@mail.gmail.com>
	<74009531-f6ef-4ef9-b969-353684006ddc@suse.com>
	<20210812174523.GC1757@redhat.com>
	<a8800dfb-a253-5b43-f47c-bd5b9076c2ae@suse.com>
MIME-Version: 1.0
In-Reply-To: <a8800dfb-a253-5b43-f47c-bd5b9076c2ae@suse.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 13, 2021 at 02:49:04PM +0800, Gang He wrote:
> Hi David,
> 
> On 2021/8/13 1:45, David Teigland wrote:
> > On Thu, Aug 12, 2021 at 01:44:53PM +0800, Gang He wrote:
> > > In fact, I can reproduce this problem stably.
> > > I want to know if this error happen is by our expectation? since there is
> > > not any extreme pressure test.
> > > Second, how should we handle these error cases? call dlm_lock function
> > > again? maybe the function will fails again, that will lead to kernel
> > > soft-lockup after multiple re-tries.
> > 
> > What's probably happening is that ocfs2 calls dlm_unlock(CANCEL) to cancel
> > an in-progress dlm_lock() request.  Before the cancel completes (or the
> > original request completes), ocfs2 calls dlm_lock() again on the same
> > resource.  This dlm_lock() returns -EBUSY because the previous request has
> > not completed, either normally or by cancellation.  This is expected.
> These dlm_lock and dlm_unlock are invoked in the same node, or the different
> nodes?

different

> > A couple options to try: wait for the original request to complete
> > (normally or by cancellation) before calling dlm_lock() again, or retry
> > dlm_lock() on -EBUSY.
> If I retry dlm_lock() repeatedly, I just wonder if this will lead to kernel
> soft lockup or waste lots of CPU.

I'm not aware of other code doing this, so I can't tell you with certainty.
It would depend largely on the implementation in the caller.

> If dlm_lock() function returns -EAGAIN, how should we handle this case?
> retry it repeatedly?

Again, this is a question more about the implementation of the calling
code and what it wants to do.  EAGAIN is specifically related to the
DLM_LKF_NOQUEUE flag.

