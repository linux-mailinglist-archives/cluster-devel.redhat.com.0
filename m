Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9CD696E54
	for <lists+cluster-devel@lfdr.de>; Tue, 14 Feb 2023 21:18:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676405893;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=1sZO92tdzWoUVi2xofFd80l2w2bqzbVtqpHGsxjpfWY=;
	b=Dm7h6O4jCJGfSlYskrcJ23orSDw7wj/aCsz6CmpcQzWCZmlQOJjiwfhq9ELn4nwq/C5xaE
	i81VyJAoNpvvkbpUMyZVFdza/r8XrB98MwY5nyLlogsj4nrIB8EEXwMuKswkJ3Qt+TTcV1
	o4JicX7SrtdfKQ/vsG8CVscN9+LMb7Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-340-LvlFh1y8Mqiq6XVxqni_iw-1; Tue, 14 Feb 2023 15:18:09 -0500
X-MC-Unique: LvlFh1y8Mqiq6XVxqni_iw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D7B6529AB3E1;
	Tue, 14 Feb 2023 20:18:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 918AF40C945A;
	Tue, 14 Feb 2023 20:18:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 47D161946595;
	Tue, 14 Feb 2023 20:18:07 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 31F351946586 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 14 Feb 2023 20:18:06 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 05FEC1121318; Tue, 14 Feb 2023 20:18:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F1B9E1121314
 for <cluster-devel@redhat.com>; Tue, 14 Feb 2023 20:18:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D450A1869B60
 for <cluster-devel@redhat.com>; Tue, 14 Feb 2023 20:18:05 +0000 (UTC)
Received: from valentin-vidic.from.hr (valentin-vidic.from.hr
 [169.150.239.92]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-178-TrRAhDR3OM-9WjO5XUYHag-1; Tue, 14 Feb 2023 15:18:02 -0500
X-MC-Unique: TrRAhDR3OM-9WjO5XUYHag-1
X-Virus-Scanned: Debian amavisd-new at valentin-vidic.from.hr
Received: by valentin-vidic.from.hr (Postfix, from userid 1000)
 id 94E112AA59; Tue, 14 Feb 2023 21:17:58 +0100 (CET)
Date: Tue, 14 Feb 2023 21:17:58 +0100
From: Valentin Vidic <vvidic@debian.org>
To: "Fabio M. Di Nitto" <fdinitto@redhat.com>
Message-ID: <Y+vsdnFHPJifPzE/@valentin-vidic.from.hr>
References: <cd93d4eb-ac20-1ef5-3770-95bd2da2c519@redhat.com>
 <Y+fNfux8S615OSqd@valentin-vidic.from.hr>
 <27e6ad15-381b-12b9-3c3a-310bd886a94a@redhat.com>
 <417a9b47-f893-2a9e-25f1-bb7e9feb20e2@redhat.com>
MIME-Version: 1.0
In-Reply-To: <417a9b47-f893-2a9e-25f1-bb7e9feb20e2@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [Cluster-devel] [ClusterLabs] gfs2-utils 3.5.0 released
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: cluster-devel <cluster-devel@redhat.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 14, 2023 at 06:18:55AM +0100, Fabio M. Di Nitto wrote:
> The process would have to look like:
> 
> <deploy amd64 debian image and add to CI> (usual)
> apt-get install <list of packages + 32 bit versions of them>
> git clone gfs2-utils
> export CFLAGS/LDFLAGS/CC or whatever env var
> <normal build bits go here>
> ./autogen.sh
> ./configure..
> make
> make <tests>
> 
> Using other build tools like debbuild or mock has been problematic in the
> past for other projects, might not be the case for gfs2-utils.
> 
> so you can try that all in a local VM and let me know the steps, then we can
> add it to CI.

Sure, the commands to build and test a 32-bit version look like this for me:

dpkg --add-architecture i386
apt-get update
apt-get install --yes build-essential crossbuild-essential-i386 autoconf automake autopoint autotools-dev bison flex check:i386 libblkid-dev:i386 libbz2-dev:i386 libncurses-dev:i386 libtool pkg-config:i386 zlib1g-dev:i386
./configure --build=x86_64-linux-gnu --host=i686-linux-gnu
make
make check

-- 
Valentin

