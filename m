Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8A89D726
	for <lists+cluster-devel@lfdr.de>; Mon, 26 Aug 2019 22:01:36 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3DF41793EC;
	Mon, 26 Aug 2019 20:01:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E9949600C8;
	Mon, 26 Aug 2019 20:01:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 98F4B1802218;
	Mon, 26 Aug 2019 20:01:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7QK1WrF018931 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 26 Aug 2019 16:01:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7FA421001B1A; Mon, 26 Aug 2019 20:01:32 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EBD451001B11;
	Mon, 26 Aug 2019 20:01:29 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E33282551B;
	Mon, 26 Aug 2019 20:01:29 +0000 (UTC)
Date: Mon, 26 Aug 2019 16:01:29 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <1906522774.10715376.1566849689894.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190826161825.11100-1-agruenba@redhat.com>
References: <20190826161825.11100-1-agruenba@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.3.117.77, 10.4.195.22]
Thread-Topic: gfs2: Get rid of gfs2_io_error_bh_wd
Thread-Index: SjSbSxPtgvtzb2lAdS88heJ9pgaIfg==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH] gfs2: Get rid of gfs2_io_error_bh_wd
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Mon, 26 Aug 2019 20:01:35 +0000 (UTC)

----- Original Message -----
> [This is a follow-up to patch "gfs2: Introduce concept of a pending withdraw"
> in Bob's recovery patch queue, which introduces the SDF_WITHDRAWING flag.]
> 
> Get rid of gfs2_io_error_bh_wd and make gfs2_io_error_bh withdraw implicitly
> again.  If the SDF_WITHDRAWING flag is set, skip the withdraw.  This reverts
> the rest of commit 9e1a9ecd13b9.
> 
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> ---

Yeah, looks good.

Reviewed-by: Bob Peterson <rpeterso@redhat.com>

