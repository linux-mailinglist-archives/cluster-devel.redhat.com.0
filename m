Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 6D1F3260637
	for <lists+cluster-devel@lfdr.de>; Mon,  7 Sep 2020 23:23:45 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-FlpDnrceNnGmAWT__R4i4A-1; Mon, 07 Sep 2020 17:23:43 -0400
X-MC-Unique: FlpDnrceNnGmAWT__R4i4A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E21D618B9EE7;
	Mon,  7 Sep 2020 21:23:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FF3F60BE2;
	Mon,  7 Sep 2020 21:23:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C8758181A06B;
	Mon,  7 Sep 2020 21:23:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 087LMDe8003624 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 7 Sep 2020 17:22:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C8C242166B44; Mon,  7 Sep 2020 21:22:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C24082166B28
	for <cluster-devel@redhat.com>; Mon,  7 Sep 2020 21:22:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 70C7B856DE8
	for <cluster-devel@redhat.com>; Mon,  7 Sep 2020 21:22:11 +0000 (UTC)
Received: from valentin-vidic.from.hr (valentin-vidic.from.hr
	[94.229.67.141]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-2-NlwbrJiuMfysVe8xx7XR4w-1; Mon, 07 Sep 2020 17:22:08 -0400
X-MC-Unique: NlwbrJiuMfysVe8xx7XR4w-1
X-Virus-Scanned: Debian amavisd-new at valentin-vidic.from.hr
Received: by valentin-vidic.from.hr (Postfix, from userid 1000)
	id 3E847357D; Mon,  7 Sep 2020 23:22:01 +0200 (CEST)
Date: Mon, 7 Sep 2020 23:22:01 +0200
From: Valentin Vidic <vvidic@debian.org>
To: Andrew Price <anprice@redhat.com>
Message-ID: <20200907212201.GS8773@valentin-vidic.from.hr>
References: <b1234ece-f35b-f77a-32c1-f8d351ae48a6@redhat.com>
	<20200903223932.GK8773@valentin-vidic.from.hr>
	<06377e85-04f1-d828-9e75-d81629fcd59c@redhat.com>
	<20200904061827.GL8773@valentin-vidic.from.hr>
	<ef84ca52-ea0b-ecda-b1b8-2d33a4480c83@redhat.com>
	<20200904174205.GQ8773@valentin-vidic.from.hr>
	<077d4fb3-5642-f050-f68c-fb23964c3e02@redhat.com>
MIME-Version: 1.0
In-Reply-To: <077d4fb3-5642-f050-f68c-fb23964c3e02@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [ClusterLabs] gfs2-utils 3.3.0 released
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 07, 2020 at 02:00:41PM +0100, Andrew Price wrote:
> It should be consistent if it's the same alignment issue, I think. Perhaps
> the build machines are different flavours of arm?

That is possible, second build was scheduled on a different machine.

> Could you give this one a try:
> 
> https://pagure.io/gfs2-utils/c/eb102019?branch=andyp-restore-init-align

Thanks, tests look good again on sparc64 with this patch applied:

gfs2_edit tests

 31: Save/restoremeta, defaults                      ok
 32: Save/restoremeta, no compression                ok
 33: Save/restoremeta, min. block size               ok
 34: Save/restoremeta, 4 journals                    ok
 35: Save/restoremeta, min. block size, 4 journals   ok
 36: Save metadata to /dev/null                      ok

-- 
Valentin

