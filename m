Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 0C2AC1AE000
	for <lists+cluster-devel@lfdr.de>; Fri, 17 Apr 2020 16:36:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587134170;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LaoWRw9Hyu8UWWe3y3dy4gUcsNqWhHgyWL3ApnHR4Og=;
	b=M/eEovuf5Aww5+TvkphCRNJ8eBDPH8gk6AVS/m38Kfsi7cj6DKXZM+lWKU9a2Sa26xrjx7
	+aMwKDztWYl+4ifXYuc31d646/V3JbRE1OfuZp/A9pUwXp3wV6I9ZAt1STQIY9FrRNtRgg
	wz3hsE+sraRhu+ncFUfvMsCFls0wiDY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-G3cpUpP0PX2muHd9HNvOYQ-1; Fri, 17 Apr 2020 10:36:09 -0400
X-MC-Unique: G3cpUpP0PX2muHd9HNvOYQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F5538018A3;
	Fri, 17 Apr 2020 14:36:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 41DDB9F9B5;
	Fri, 17 Apr 2020 14:36:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B61D118089C8;
	Fri, 17 Apr 2020 14:36:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03HEa4vI001728 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 17 Apr 2020 10:36:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0735C19757; Fri, 17 Apr 2020 14:36:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A120819C69;
	Fri, 17 Apr 2020 14:36:00 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9714693512;
	Fri, 17 Apr 2020 14:36:00 +0000 (UTC)
Date: Fri, 17 Apr 2020 10:35:58 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <23742063.22529976.1587134158526.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200417142726.188190-1-agruenba@redhat.com>
References: <202004171521.Z9s8gKSV%lkp@intel.com>
	<CAHc6FU43LpVbPEEq29cDkJ5X2t=6qACfoETw15QZX1CHKqPUbQ@mail.gmail.com>
	<1706994570.22510265.1587128956368.JavaMail.zimbra@redhat.com>
	<20200417142726.188190-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.115.143, 10.4.195.18]
Thread-Topic: fs/gfs2/util.c:126:3: error: implicit declaration of function
Thread-Index: MDv/Ni3fQoA0E/hvzM2HqY+kUTlJjg==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [gfs2:gfs2-iopen 12/12] fs/gfs2/util.c:126:3:
 error: implicit declaration of function
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

----- Original Message -----
> Hi Bob,
> 
> Hmm, sdp->sd_journal_gh has the GL_NOCACHE flag set, so the demote
> should happen immediately.  On the other hand, sdp->sd_live_gh doesn't
> have that flag set, so that may be the actual problem here.
> 
> I agree that testing will be needed.  What do you think of the below
> patch?
> 
> Thanks,
> Andreas

Hi Andreas,

I'll test it out on my cluster with some recovery tests and let you
know how it goes.

Bob

