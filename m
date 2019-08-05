Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D9E8197E
	for <lists+cluster-devel@lfdr.de>; Mon,  5 Aug 2019 14:40:04 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1D9FB30224A8;
	Mon,  5 Aug 2019 12:40:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C4CC010018F9;
	Mon,  5 Aug 2019 12:40:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 20C3F4E9F4;
	Mon,  5 Aug 2019 12:40:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x75CcU8n018508 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 5 Aug 2019 08:38:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 503D61000323; Mon,  5 Aug 2019 12:38:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 15ED81000321;
	Mon,  5 Aug 2019 12:38:28 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0E2594E589;
	Mon,  5 Aug 2019 12:38:28 +0000 (UTC)
Date: Mon, 5 Aug 2019 08:38:28 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <480969416.6658004.1565008708021.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190805122518.6526-1-agruenba@redhat.com>
References: <20190805122518.6526-1-agruenba@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.3.116.200, 10.4.195.25]
Thread-Topic: gfs2: gfs2_walk_metadata fix
Thread-Index: 4KWfZyYbOeDUtnp6iRinvdff8nDFog==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH] gfs2: gfs2_walk_metadata fix
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Mon, 05 Aug 2019 12:40:03 +0000 (UTC)

----- Original Message -----
> In gfs2_walk_metadata, always reset mp->mp_list when decreasing the
> current height.  Otherwise, gfs2_walk_metadata can end up skipping
> metadata.
> 
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> ---
Looks good.

Reviewed-by: Bob Peterson <rpeterso@redhat.com>

Bob

