Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id C434D14924A
	for <lists+cluster-devel@lfdr.de>; Sat, 25 Jan 2020 01:19:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579911539;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PhjvwfN7f4ykcrsmZQg6eW5FMPj+NspeW5CWPfe8aQw=;
	b=QzY3wf4Z85ldsD0H4TWMsbyBT0uIw8vjr0zAj8HejwhuwTD80ohJTd18su/Lm8fvhkzB8i
	Z18uyvY8sP9OwzN8Q6ycTbz3LYZsRBZWMUGmA7XHa9xvH38/9bhzS8Z70ug67038SmrVeQ
	LUPedzRnbsSMbUix/74QbIMLUqijWcg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-hmpyZS-0PoqqbO2oMZiSLA-1; Fri, 24 Jan 2020 19:18:58 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F06D1854354;
	Sat, 25 Jan 2020 00:18:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C61981001B07;
	Sat, 25 Jan 2020 00:18:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 07A3B85957;
	Sat, 25 Jan 2020 00:18:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00P0Iknh007401 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 24 Jan 2020 19:18:47 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D0B931054F17; Sat, 25 Jan 2020 00:18:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CBAAE1054F09
	for <cluster-devel@redhat.com>; Sat, 25 Jan 2020 00:18:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 618B9185AB78
	for <cluster-devel@redhat.com>; Sat, 25 Jan 2020 00:18:44 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-350-XhX1GQYNPpGyWcrJx8JAqA-1;
	Fri, 24 Jan 2020 19:18:42 -0500
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Jan 2020 16:18:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,359,1574150400"; d="scan'208";a="260419372"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
	by fmsmga002.fm.intel.com with ESMTP; 24 Jan 2020 16:18:40 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
	(envelope-from <lkp@intel.com>)
	id 1iv99r-0006DF-OR; Sat, 25 Jan 2020 08:18:39 +0800
Date: Sat, 25 Jan 2020 08:17:42 +0800
From: kbuild test robot <lkp@intel.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20200125001741.uobzbe55s7gpwefi@f53c9c00458a>
References: <202001250859.Hrvdf2d0%lkp@intel.com>
MIME-Version: 1.0
In-Reply-To: <202001250859.Hrvdf2d0%lkp@intel.com>
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
X-MC-Unique: XhX1GQYNPpGyWcrJx8JAqA-1
X-MC-Unique: hmpyZS-0PoqqbO2oMZiSLA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00P0Iknh007401
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, kbuild-all@lists.01.org
Subject: [Cluster-devel] [RFC PATCH gfs2] __gfs2_inode_remember_delete() can
	be static
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline


Fixes: 90a0918fc357 ("DEBUG")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 glock.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index b0d5c98f476eb..75524557c96f4 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -684,7 +684,7 @@ __acquires(&gl->gl_lockref.lock)
 =09return;
 }
=20
-void __gfs2_inode_remember_delete(struct gfs2_glock *gl, u64 generation)
+static void __gfs2_inode_remember_delete(struct gfs2_glock *gl, u64 genera=
tion)
 {
 =09struct gfs2_inode_lvb *ri =3D (void *)gl->gl_lksb.sb_lvbptr;
=20


