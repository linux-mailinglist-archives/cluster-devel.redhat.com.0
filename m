Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 79E7113C27C
	for <lists+cluster-devel@lfdr.de>; Wed, 15 Jan 2020 14:19:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579094367;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Kq/p14v4T1Em3sVrr3zOkLOl6b/o0TU4/Uh1Lum5iqc=;
	b=VxyItzrqlVK/ZThKtVmmnHmSTBWisGeBG+ey0ImIsJYVZIR+9J4bYGQm1hpYF0vkvjx2oS
	mZhl6XkEMA9E4k7NE3WkASJiGcHlEL1n7iGQTxgycuFE2CygQROmQfkos3mZZblvRSyYYN
	16hQyNqPOPPj+HgdvIlqs5cj+gvsGjQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-JWibMpT5PzS4RRzNSKUzaw-1; Wed, 15 Jan 2020 08:19:25 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07A961005510;
	Wed, 15 Jan 2020 13:19:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E166E60F88;
	Wed, 15 Jan 2020 13:19:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 74583824EA;
	Wed, 15 Jan 2020 13:19:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00FDJKRM003188 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 15 Jan 2020 08:19:20 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D30598888A; Wed, 15 Jan 2020 13:19:20 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 379B188894;
	Wed, 15 Jan 2020 13:19:18 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2907518095FF;
	Wed, 15 Jan 2020 13:19:18 +0000 (UTC)
Date: Wed, 15 Jan 2020 08:19:17 -0500 (EST)
From: Bob Peterson <rpeterso@redhat.com>
To: Steven Whitehouse <swhiteho@redhat.com>
Message-ID: <1946139195.2641427.1579094357901.JavaMail.zimbra@redhat.com>
In-Reply-To: <62faa428-a933-4848-d897-deb038078ac3@redhat.com>
References: <20200115084956.7405-1-agruenba@redhat.com>
	<d7d86bca-522a-48f5-bee3-bae50cd04485@redhat.com>
	<CAHc6FU6UrNOenH6swABCOU2ZTh5NUfns-QeA29PSDsMwxFA1sQ@mail.gmail.com>
	<62faa428-a933-4848-d897-deb038078ac3@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.116.64, 10.4.195.10]
Thread-Topic: Move struct gfs2_rgrp_lvb out of gfs2_ondisk.h
Thread-Index: xubCKMiAWfXATy5DyM5GQDaSs7IOvg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [PATCH] Move struct gfs2_rgrp_lvb out of
 gfs2_ondisk.h
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
X-MC-Unique: JWibMpT5PzS4RRzNSKUzaw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

----- Original Message -----
> Hi,
> 
> On 15/01/2020 09:24, Andreas Gruenbacher wrote:
> > On Wed, Jan 15, 2020 at 9:58 AM Steven Whitehouse <swhiteho@redhat.com>
> > wrote:
> >> On 15/01/2020 08:49, Andreas Gruenbacher wrote:
> >>> There's no point in sharing the internal structure of lock value blocks
> >>> with user space.
> >> The reason that is in ondisk is that changing that structure is
> >> something that needs to follow the same rules as changing the on disk
> >> structures. So it is there as a reminder of that,
> > I can see a point in that. The reason I've posted this is because Bob
> > was complaining that changes to include/uapi/linux/gfs2_ondisk.h break
> > his out-of-tree module build process. (One of the patches I'm working
> > on adds an inode LVB.) The same would be true of on-disk format
> > changes as well of course, and those definitely need to be shared with
> > user space. I'm not usually building gfs2 out of tree, so I'm
> > indifferent to this change.
> >
> > Thanks,
> > Andreas
> >
> Why would we need to be able to build gfs2 (at least I assume it is
> gfs2) out of tree anyway?
> 
> Steve.

Simply for productivity. The difference is this procedure, which literally takes 10 seconds,
if done simultaneously on all nodes using something like cssh:

make -C /usr/src/kernels/4.18.0-165.el8.x86_64 modules M=$PWD
rmmod gfs2
insmod gfs2.ko

Compared to a procedure like this, which takes at least 30 minutes:

make (a new kernel .src.rpm)
scp or rsync the .src.rpm to a build machine
cd ~/rpmbuild/
rpm --force -i --nodeps /home/bob/*kernel-4.18.0*.src.rpm &> /dev/null
echo $?
rpmbuild --target=x86_64 -ba SPECS/kernel.spec
( -or- submit a "real" kernel build)
then wait for the kernel build
Pull down all necessary kernel rpms
scp <those rpms> to all the nodes in the cluster
rpm --force -i --nodeps <those rpms>
/sbin/reboot all the nodes in the cluster
wait for all the nodes to reboot, the cluster to stabilize, etc.

Regards,

Bob Peterson
Red Hat File Systems

