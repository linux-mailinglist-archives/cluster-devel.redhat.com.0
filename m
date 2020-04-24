Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id A0E2A1B7992
	for <lists+cluster-devel@lfdr.de>; Fri, 24 Apr 2020 17:29:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587742184;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DiPl/TfS8jbxD1Eeh2UkEtHV7fs8NnbF1pN3xzIpspk=;
	b=TBLsEzt3za/m/dZoUxVW/kuLrKH4k6g7SzYAlCXSI3YRQqWm2D/y6YivRmZ25FJXebRbel
	O/o192aIaNZDTMIiOBA40sBficwewSAgE6Fxlcn5YNX13s5rBbIuFAI/z6f0iorjqfATxe
	Onj7k0CkCO94IfHc5Qht8Y4pQ/Rd7P0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-iAKHZtEVN9633HH5DIEy9w-1; Fri, 24 Apr 2020 11:29:41 -0400
X-MC-Unique: iAKHZtEVN9633HH5DIEy9w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B40DA460;
	Fri, 24 Apr 2020 15:29:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BB17B5D9CC;
	Fri, 24 Apr 2020 15:29:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 729BF4CAA0;
	Fri, 24 Apr 2020 15:29:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03OFTZbR011946 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 24 Apr 2020 11:29:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 34EB960CD0; Fri, 24 Apr 2020 15:29:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F14A60C81
	for <cluster-devel@redhat.com>; Fri, 24 Apr 2020 15:29:32 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7897B18095FF;
	Fri, 24 Apr 2020 15:29:32 +0000 (UTC)
Date: Fri, 24 Apr 2020 11:29:30 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <1331889228.24558044.1587742170641.JavaMail.zimbra@redhat.com>
In-Reply-To: <7514ea47-d0c5-ab01-8932-ab6602321b49@citrix.com>
References: <7514ea47-d0c5-ab01-8932-ab6602321b49@citrix.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.112.238, 10.4.195.6]
Thread-Topic: BUG during umount() after withdrawal
Thread-Index: Np3XeqlRNhCH4y41xaeAkX9sOxzyFQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] BUG during umount() after withdrawal
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

----- Original Message -----
> Hi,
> 
> I'm doing some testing on 5.7-rc2 which includes Bob's recovery patches.
> I used a new xfstest (see the end of this mail) which injects some
> IO errors to force the filesystem to be withdrawn and then checks
> that it can be remounted successfully.
> 
> However, it hits a BUG() during umount() after it has been
> withdrawn:

Hi Ross,

We found this problem yesterday and I've been working on a patch to
fix it. I'll post a patch to cluster-devel as soon as it's ready.

Regards,

Bob Peterson

