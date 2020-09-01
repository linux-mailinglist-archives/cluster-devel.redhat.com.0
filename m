Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id B0C20258FFE
	for <lists+cluster-devel@lfdr.de>; Tue,  1 Sep 2020 16:13:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1598969636;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lmiElt+9vhSWgn5IQs4zZ1hI4HFHW1dobLkb12hq7e0=;
	b=JV+Ljvhmgmu2iTHMltnAHrrVINbOaXgq1Cc9UNuyOg9mFiSIZoX4Mvk+a9dV9AH+rrZGlE
	4+JrdPQsYr0ublEBIvuPQzhKIvTZecezC7L0/hs2Z4ea+rBgGRLq8Zt973HLGIYUHRhsNy
	fL8yK644XifodzhsXK8enheOt9HQYd8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-HtXhztkvNFCD9ZtmZpdQ5A-1; Tue, 01 Sep 2020 10:13:54 -0400
X-MC-Unique: HtXhztkvNFCD9ZtmZpdQ5A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36925189E606;
	Tue,  1 Sep 2020 14:13:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1767C672C0;
	Tue,  1 Sep 2020 14:13:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 98B4A181A869;
	Tue,  1 Sep 2020 14:13:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 081EBKsg014392 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 1 Sep 2020 10:11:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 394EE5C1BB; Tue,  1 Sep 2020 14:11:20 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A00D5C1A3;
	Tue,  1 Sep 2020 14:11:17 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 61E827A2E3;
	Tue,  1 Sep 2020 14:11:17 +0000 (UTC)
Date: Tue, 1 Sep 2020 10:11:17 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <1627290349.15019228.1598969477058.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200829092656.1173430-1-agruenba@redhat.com>
References: <20200829092656.1173430-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.112.23, 10.4.195.29]
Thread-Topic: gfs2: Make sure we don't miss any delayed withdraws
Thread-Index: VoLo+U/TkLWMztf9VlU2T0Q+oPJTBw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, stable@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH] gfs2: Make sure we don't miss any
 delayed	withdraws
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

----- Original Message -----
> Commit ca399c96e96e changes gfs2_log_flush to not withdraw the
> filesystem while holding the log flush lock, but it fails to check if
> the filesystem needs to be withdrawn once the log flush lock has been
> released.  Likewise, commit f05b86db314d depends on gfs2_log_flush to
> trigger for delayed withdraws.  Add that and clean up the code flow
> somewhat.
> 
> In gfs2_put_super, add a check for delayed withdraws that have been
> missed to prevent these kinds of bugs in the future.
> 
> Fixes: ca399c96e96e ("gfs2: flesh out delayed withdraw for gfs2_log_flush")
> Fixes: f05b86db314d ("gfs2: Prepare to withdraw as soon as an IO error occurs
> in log write")
> Cc: stable@vger.kernel.org # v5.7+
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> ---
Looks good.

Reviewed-by: Bob Peterson <rpeterso@redhat.com>

Bob Peterson

