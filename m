Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id ACDCC26695D
	for <lists+cluster-devel@lfdr.de>; Fri, 11 Sep 2020 22:08:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599854929;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9NNTGo8o57B1IxOchlAMEhz2Yaj3PHwUPTFJyuAmkkc=;
	b=J9V88JQEP4w80hThi/yzyNjcUD1OvD9tPsNttk6rbdcMO62jZc1rgGE6jxRCOTCULrmQsl
	tItaMfSKcYodJlrlhkOQ2XqHWdxIswixs4K47Itb29Y/SyhLpk0WsimCmjKI3NLdObaYvV
	VHnXwk3eA3hVIFfr/3Fk2NjPbMv/v9M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-dm3FVz1oPZu8EjR3hp6TPw-1; Fri, 11 Sep 2020 16:08:47 -0400
X-MC-Unique: dm3FVz1oPZu8EjR3hp6TPw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF3131074649;
	Fri, 11 Sep 2020 20:08:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E5ED45C22B;
	Fri, 11 Sep 2020 20:08:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BA757181A06B;
	Fri, 11 Sep 2020 20:08:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08BK8ZDi009591 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 11 Sep 2020 16:08:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0D3AC7512B; Fri, 11 Sep 2020 20:08:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4141E75129;
	Fri, 11 Sep 2020 20:08:32 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3904F181A050;
	Fri, 11 Sep 2020 20:08:32 +0000 (UTC)
Date: Fri, 11 Sep 2020 16:08:30 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <1182259322.16848570.1599854910130.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAHc6FU7Qirk5Sy-ZFZCiXAqgKxqX-BC6e2JtJ2YVD-vjfM=Mbg@mail.gmail.com>
References: <454279735.16583317.1599751575623.JavaMail.zimbra@redhat.com>
	<883057823.16586032.1599751594154.JavaMail.zimbra@redhat.com>
	<CAHc6FU7Qirk5Sy-ZFZCiXAqgKxqX-BC6e2JtJ2YVD-vjfM=Mbg@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.112.23, 10.4.195.2]
Thread-Topic: gfs2: truncate glock address space pages during evict
Thread-Index: 2xvGFvYUHs/vRAW7IpY6F0JcGATIEQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH] gfs2: truncate glock address space
 pages during evict
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

----- Original Message -----
> Bob,
> 
> 
> not sure why, but this patch breaks xfstests generic/311 and generic/467.

Hm, that's odd. Can you tell me how it misbehaves?
fwiw, both 311 and 467 work for me, no hangs, panics, etc.

> Also,
> don't we want to initialize metamapping earlier and also call
> truncate_inode_pages_final on it before we detach the glock?

Yes, this is a great concern now you mention it.
I've created a 5-patch set that refactors function gfs2_evict_inode
to actually make it readable. I'll test and post that next week.
 
> (Mind that truncate_inode_pages_final leaves AS_EXITING set in
> metamapping->flags, so we'll also need to do somthing about that.)

Yes, that is another concern. I'll wait and see if Johannes W. responds
to your query and we'll go from there.

Regards,

Bob Peterson

