Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6CFD9256A8A
	for <lists+cluster-devel@lfdr.de>; Sun, 30 Aug 2020 00:05:56 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-PDauNqayOpaulrdNJhy5Ww-1; Sat, 29 Aug 2020 18:05:52 -0400
X-MC-Unique: PDauNqayOpaulrdNJhy5Ww-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1ED39107465C;
	Sat, 29 Aug 2020 22:05:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE17D5C1D0;
	Sat, 29 Aug 2020 22:05:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DF51F183D020;
	Sat, 29 Aug 2020 22:05:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07TM5XFV007853 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 29 Aug 2020 18:05:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D59E95AB7A; Sat, 29 Aug 2020 22:05:33 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D17D15AB91
	for <cluster-devel@redhat.com>; Sat, 29 Aug 2020 22:05:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4ED8D101A568
	for <cluster-devel@redhat.com>; Sat, 29 Aug 2020 22:05:31 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-203-Fqd1c1pyOz-otfL2TQoClg-1;
	Sat, 29 Aug 2020 18:05:28 -0400
X-MC-Unique: Fqd1c1pyOz-otfL2TQoClg-1
Received: from localhost (unknown [70.37.104.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 234BF208CA;
	Sat, 29 Aug 2020 21:59:26 +0000 (UTC)
Date: Sat, 29 Aug 2020 21:59:25 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
In-Reply-To: <20200829092656.1173430-1-agruenba@redhat.com>
References: <20200829092656.1173430-1-agruenba@redhat.com>
Message-Id: <20200829215926.234BF208CA@mail.kernel.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: stable@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH] gfs2: Make sure we don't miss any
	delayed withdraws
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
X-Mimecast-Spam-Score: 2.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII

Hi

[This is an automated email]

This commit has been processed because it contains a "Fixes:" tag
fixing commit: ca399c96e96e ("gfs2: flesh out delayed withdraw for gfs2_log_flush").

The bot has tested the following trees: v5.8.5.

v5.8.5: Failed to apply! Possible dependencies:
    462582b99b60 ("gfs2: add some much needed cleanup for log flushes that fail")


NOTE: The patch will not be queued to stable trees until it is upstream.

How should we proceed with this patch?

-- 
Thanks
Sasha

