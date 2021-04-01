Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 659B235156F
	for <lists+cluster-devel@lfdr.de>; Thu,  1 Apr 2021 15:58:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1617285537;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4u2YgEsFSRGx4G1lMcVmKYTiRxp+/qOkBCaR8U4j8AU=;
	b=ZY35AgOOqzhjnNI+vGiyPl9BDVvVNqOhEf5spNPn5mg1ZooA6vkQ3P52V+D0Izz2cuIIS8
	y0Uwrsj+02za6VPxJm7Ee8HZJ46//1IGPr9CBOLwbu804OaiDsjztoGfMyC/7bovRb3AgR
	a/pVwFqbfzC9AZOrN0oBHyTIs4bG1mU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-wHhCgYFhNxum0oyyp0qmiw-1; Thu, 01 Apr 2021 09:58:55 -0400
X-MC-Unique: wHhCgYFhNxum0oyyp0qmiw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF4AE10C40C0;
	Thu,  1 Apr 2021 13:58:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 19DD65D9CC;
	Thu,  1 Apr 2021 13:58:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 148ED4A700;
	Thu,  1 Apr 2021 13:58:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 131DwiT8025462 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 1 Apr 2021 09:58:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AE2D45D705; Thu,  1 Apr 2021 13:58:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 931585D6B1;
	Thu,  1 Apr 2021 13:58:41 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8C6251809C82;
	Thu,  1 Apr 2021 13:58:41 +0000 (UTC)
Date: Thu, 1 Apr 2021 09:58:41 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <856241967.3788232.1617285521356.JavaMail.zimbra@redhat.com>
In-Reply-To: <20210401091839.2251916-2-agruenba@redhat.com>
References: <20210401091839.2251916-1-agruenba@redhat.com>
	<20210401091839.2251916-2-agruenba@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.112.15, 10.4.195.5]
Thread-Topic: gfs2: Add new gfs2_iomap_get helper
Thread-Index: XXekkFgU10CH4J4wKth11n5C2wnqWg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH 1/4] gfs2: Add new gfs2_iomap_get helper
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
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

----- Original Message -----
> Rename the current gfs2_iomap_get and gfs2_iomap_alloc functions to __*.
> Add a new gfs2_iomap_get helper that doesn't expose struct metapath.
> Rename gfs2_iomap_get_alloc to gfs2_iomap_alloc.  Use the new helpers
> where they make sense.
> 
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
Reviewed-by: Bob Peterson <rpeterso@redhat.com>

