Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 2122E25CFAE
	for <lists+cluster-devel@lfdr.de>; Fri,  4 Sep 2020 05:15:00 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-BjSBFZCQNX6v8LAHSsY6Uw-1; Thu, 03 Sep 2020 23:14:57 -0400
X-MC-Unique: BjSBFZCQNX6v8LAHSsY6Uw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4013F801AEE;
	Fri,  4 Sep 2020 03:14:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E6351002D5E;
	Fri,  4 Sep 2020 03:14:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 916B71826D2A;
	Fri,  4 Sep 2020 03:14:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 083MjGiv029204 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 3 Sep 2020 18:45:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 92A3BF6CA2; Thu,  3 Sep 2020 22:45:16 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8DD9FF49CB
	for <cluster-devel@redhat.com>; Thu,  3 Sep 2020 22:45:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9505489D4AA
	for <cluster-devel@redhat.com>; Thu,  3 Sep 2020 22:45:13 +0000 (UTC)
Received: from valentin-vidic.from.hr (valentin-vidic.from.hr
	[94.229.67.141]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-492-bT45brRBNIun7iZyqmoyYw-1; Thu, 03 Sep 2020 18:45:11 -0400
X-MC-Unique: bT45brRBNIun7iZyqmoyYw-1
X-Virus-Scanned: Debian amavisd-new at valentin-vidic.from.hr
Received: by valentin-vidic.from.hr (Postfix, from userid 1000)
	id 8813B3506; Fri,  4 Sep 2020 00:39:32 +0200 (CEST)
Date: Fri, 4 Sep 2020 00:39:32 +0200
From: Valentin =?utf-8?B?VmlkacSH?= <vvidic@debian.org>
To: Andrew Price <anprice@redhat.com>
Message-ID: <20200903223932.GK8773@valentin-vidic.from.hr>
References: <b1234ece-f35b-f77a-32c1-f8d351ae48a6@redhat.com>
MIME-Version: 1.0
In-Reply-To: <b1234ece-f35b-f77a-32c1-f8d351ae48a6@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
X-Mailman-Approved-At: Thu, 03 Sep 2020 23:14:52 -0400
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

On Tue, Sep 01, 2020 at 04:41:44PM +0100, Andrew Price wrote:
> I am pleased to announce the 3.3.0 release of gfs2-utils.
> 
> This release brings further tooling support for the new log header and
> resource group fields, bug fixes across the board, testing improvements, and
> various other fixes, cleanups and code re-structuring.

Hi, it seems some tests fail during ARM build:

gfs2_edit tests

 31: Save/restoremeta, defaults                      FAILED (edit.at:13)
 32: Save/restoremeta, no compression                FAILED (edit.at:23)
 33: Save/restoremeta, min. block size               FAILED (edit.at:33)
 34: Save/restoremeta, 4 journals                    FAILED (edit.at:43)
 35: Save/restoremeta, min. block size, 4 journals   FAILED (edit.at:53)
 36: Save metadata to /dev/null                      ok

More details here:

https://buildd.debian.org/status/fetch.php?pkg=gfs2-utils&arch=armhf&ver=3.3.0-1&stamp=1599171965&file=log

-- 
Valentin

