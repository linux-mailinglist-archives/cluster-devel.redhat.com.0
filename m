Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 570CB13C36B
	for <lists+cluster-devel@lfdr.de>; Wed, 15 Jan 2020 14:43:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579095813;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=s1vZFoKh0DTAe3dVRXSYM8pi1I7VKYZi1TcCGXEbrfk=;
	b=iIPLiEI3KzdRxhkCaYaVHcHCuNiy787e6UCjOO87tR02LfYTpYnNJ+zPNTRUeUBJPQG3Oi
	JOI8nNInRzEetLbmxiwlpe2SSm7/znuTNwjLuH/+7oCRAZlcH27X99559jYp4tgw1fHjjY
	Yjtzv2by0FZquMjnfxfZEVWZQI5Q2KM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-4zGs35u_M0yCpfT1W17Jsg-1; Wed, 15 Jan 2020 08:43:32 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90B6985EE8B;
	Wed, 15 Jan 2020 13:43:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2591910372F3;
	Wed, 15 Jan 2020 13:43:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A85AD18089CE;
	Wed, 15 Jan 2020 13:43:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00FDhPjV004602 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 15 Jan 2020 08:43:25 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7B51580F5C; Wed, 15 Jan 2020 13:43:25 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF7BF811E6;
	Wed, 15 Jan 2020 13:43:22 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E404F824EC;
	Wed, 15 Jan 2020 13:43:22 +0000 (UTC)
Date: Wed, 15 Jan 2020 08:43:22 -0500 (EST)
From: Bob Peterson <rpeterso@redhat.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <793501366.2644404.1579095802763.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200115083040.32714-1-agruenba@redhat.com>
References: <20200115083040.32714-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.116.64, 10.4.195.3]
Thread-Topic: gfs2: Avoid access time trashing in gfs2_inode_lookup
Thread-Index: vsVk6oxI7YE/yP1KD7NHgROCCj5xBA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH] gfs2: Avoid access time trashing in
 gfs2_inode_lookup
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
X-MC-Unique: 4zGs35u_M0yCpfT1W17Jsg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

----- Original Message -----
> In gfs2_inode_lookup, we initialize inode->i_atime to the lowest
> possibly value after gfs2_inode_refresh may already have been called.
> This should be the other way around, but we didn't notice because
> usually the inode type is known from the directory entry and so
> gfs2_inode_lookup won't call gfs2_inode_refresh.
> 
> In addition, only initialize ip->i_no_formal_ino from no_formal_ino when
> actually needed.
> 
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> ---

Hi,

The patch looks good, but can we please change the description from:
    "trashing"
to:
    "thrashing"?

Reviewed-by: Bob Peterson <rpeterso@redhat.com>
Thanks.

Bob Peterson
Red Hat File Systems

