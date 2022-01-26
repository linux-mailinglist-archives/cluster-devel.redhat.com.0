Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3421449D33A
	for <lists+cluster-devel@lfdr.de>; Wed, 26 Jan 2022 21:13:38 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-307-HmciFJqvOCymU7LljSdUww-1; Wed, 26 Jan 2022 15:13:34 -0500
X-MC-Unique: HmciFJqvOCymU7LljSdUww-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F04F1083F61;
	Wed, 26 Jan 2022 20:13:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B58B1009962;
	Wed, 26 Jan 2022 20:13:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B7E431809CB8;
	Wed, 26 Jan 2022 20:13:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
	[10.11.54.7])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20QKDIbQ022252 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 26 Jan 2022 15:13:18 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id ACB751400E73; Wed, 26 Jan 2022 20:13:18 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A88671400E70
	for <cluster-devel@redhat.com>; Wed, 26 Jan 2022 20:13:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8DB2A1044561
	for <cluster-devel@redhat.com>; Wed, 26 Jan 2022 20:13:18 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-471-aLdKqZslPWq6FWIOxfiTHQ-1; Wed, 26 Jan 2022 15:13:17 -0500
X-MC-Unique: aLdKqZslPWq6FWIOxfiTHQ-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 66A85B81EA6;
	Wed, 26 Jan 2022 20:07:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23476C340E3;
	Wed, 26 Jan 2022 20:07:04 +0000 (UTC)
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id DB7EB5C043B; Wed, 26 Jan 2022 12:07:03 -0800 (PST)
Date: Wed, 26 Jan 2022 12:07:03 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Alexander Aring <aahringo@redhat.com>
Message-ID: <20220126200703.GZ4285@paulmck-ThinkPad-P17-Gen-1>
References: <20220126150354.3644838-1-aahringo@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220126150354.3644838-1-aahringo@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, jiangshanlai@gmail.com, josh@joshtriplett.org,
	rostedt@goodmis.org, rcu@vger.kernel.org, mathieu.desnoyers@efficios.com
Subject: Re: [Cluster-devel] [PATCH] srcutree: use export for srcu_struct
 defined by DEFINE_STATIC_SRCU()
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: paulmck@kernel.org
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 26, 2022 at 10:03:54AM -0500, Alexander Aring wrote:
> This patch fixes a sparse issue if DEFINE_STATIC_SRCU() of srcutree is
> used by a module. Sparse will show:
> 
> sparse: symbol '__srcu_struct_nodes_srcu' was not declared. Should it be static?
> 
> The problem is here that the DEFINE_STATIC_SRCU() of srcutree uses
> __DEFINE_SRCU() and define a non-static srcu_struct. This srcu_struct
> will be exported by inserting it in a special module section
> '__section("___srcu_struct_ptrs")'. During load/unloading srcutree runs
> their init/cleanup functionality. It seems sparse does not understand
> this connection. To avoid the sparse warning we make a prototype of the
> exported srcu_struct with an export keyword. This way we tell the
> that the srcu_struct might be used outside of the module.
> 
> Signed-off-by: Alexander Aring <aahringo@redhat.com>

Queued for further review and testing, thank you!!!

As usual, I could not resist the urge to wordsmith a bit.  Could you
please check below in case I messed something up?

							Thanx, Paul

------------------------------------------------------------------------

commit fa92d727f94486195e12dc782fec17d103072101
Author: Alexander Aring <aahringo@redhat.com>
Date:   Wed Jan 26 10:03:54 2022 -0500

    srcutree: Use export for srcu_struct defined by DEFINE_STATIC_SRCU()
    
    If an srcu_struct structure defined by tree SRCU's DEFINE_STATIC_SRCU()
    is used by a module, sparse will give the following diagnostic:
    
    sparse: symbol '__srcu_struct_nodes_srcu' was not declared. Should it be static?
    
    The problem is that a within-module DEFINE_STATIC_SRCU() must define
    a non-static srcu_struct because it is exported by referencing it in a
    special '__section("___srcu_struct_ptrs")'.  This reference is needed
    so that module load and unloading can invoke init_srcu_struct() and
    cleanup_srcu_struct(), respectively.  Unfortunately, sparse is unaware of
    '__section("___srcu_struct_ptrs")', resulting in the above false-positive
    diagnostic.  To avoid this false positive, this commit therefore creates
    a prototype of the srcu_struct with an "extern" keyword.
    
    Signed-off-by: Alexander Aring <aahringo@redhat.com>
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

diff --git a/include/linux/srcutree.h b/include/linux/srcutree.h
index 8501b6b459411..44e998643f483 100644
--- a/include/linux/srcutree.h
+++ b/include/linux/srcutree.h
@@ -131,6 +131,7 @@ struct srcu_struct {
 #ifdef MODULE
 # define __DEFINE_SRCU(name, is_static)					\
 	is_static struct srcu_struct name;				\
+	extern struct srcu_struct * const __srcu_struct_##name;		\
 	struct srcu_struct * const __srcu_struct_##name			\
 		__section("___srcu_struct_ptrs") = &name
 #else

