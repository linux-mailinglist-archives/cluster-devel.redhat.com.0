Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 1AF8A25E121
	for <lists+cluster-devel@lfdr.de>; Fri,  4 Sep 2020 19:42:39 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-QWIeEZGkNWmGMtPN63Jp1A-1; Fri, 04 Sep 2020 13:42:36 -0400
X-MC-Unique: QWIeEZGkNWmGMtPN63Jp1A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D1C4801AB8;
	Fri,  4 Sep 2020 17:42:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 63CBA1002D57;
	Fri,  4 Sep 2020 17:42:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 192A679DAE;
	Fri,  4 Sep 2020 17:42:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 084HgJtA030899 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 4 Sep 2020 13:42:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0DB3711921A7; Fri,  4 Sep 2020 17:42:19 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 08AD511921A4
	for <cluster-devel@redhat.com>; Fri,  4 Sep 2020 17:42:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AAA39827EE4
	for <cluster-devel@redhat.com>; Fri,  4 Sep 2020 17:42:16 +0000 (UTC)
Received: from valentin-vidic.from.hr (valentin-vidic.from.hr
	[94.229.67.141]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-262-cCOEojlfMhC4LRPx5wHK1Q-1; Fri, 04 Sep 2020 13:42:12 -0400
X-MC-Unique: cCOEojlfMhC4LRPx5wHK1Q-1
X-Virus-Scanned: Debian amavisd-new at valentin-vidic.from.hr
Received: by valentin-vidic.from.hr (Postfix, from userid 1000)
	id 622D73536; Fri,  4 Sep 2020 19:42:05 +0200 (CEST)
Date: Fri, 4 Sep 2020 19:42:05 +0200
From: Valentin Vidic <vvidic@debian.org>
To: Andrew Price <anprice@redhat.com>
Message-ID: <20200904174205.GQ8773@valentin-vidic.from.hr>
References: <b1234ece-f35b-f77a-32c1-f8d351ae48a6@redhat.com>
	<20200903223932.GK8773@valentin-vidic.from.hr>
	<06377e85-04f1-d828-9e75-d81629fcd59c@redhat.com>
	<20200904061827.GL8773@valentin-vidic.from.hr>
	<ef84ca52-ea0b-ecda-b1b8-2d33a4480c83@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ef84ca52-ea0b-ecda-b1b8-2d33a4480c83@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 04, 2020 at 02:42:10PM +0100, Andrew Price wrote:
> I'm pretty sure I know which change added the bug, but my Debian sparc64 vm
> is hitting this problem too frequently to test:
> 
> https://lkml.org/lkml/2020/5/18/1455
> 
> So probably the best I can do is build with -Wcast-align=strict and make the
> relevant warning go away.

I tried to reproduce the problem on arm, but after a rebuild tests look
fine, so I'm not sure anymore if this is a new problem or something that
happens randomly.

For sparc64 it seems to be reproducible and I have access to a machine
in case you want me to test some patches.

-- 
Valentin

