Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4EEF92BC643
	for <lists+cluster-devel@lfdr.de>; Sun, 22 Nov 2020 15:57:02 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-132-XJwKVwB3PvWEgJ8KF9Ol4w-1; Sun, 22 Nov 2020 09:56:58 -0500
X-MC-Unique: XJwKVwB3PvWEgJ8KF9Ol4w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 417458030BE;
	Sun, 22 Nov 2020 14:56:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D780A100238C;
	Sun, 22 Nov 2020 14:56:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9596D4A7C7;
	Sun, 22 Nov 2020 14:56:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AMEuk7B007511 for <cluster-devel@listman.util.phx.redhat.com>;
	Sun, 22 Nov 2020 09:56:46 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id EA2C62026D16; Sun, 22 Nov 2020 14:56:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E4E222026D13
	for <cluster-devel@redhat.com>; Sun, 22 Nov 2020 14:56:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9224E800157
	for <cluster-devel@redhat.com>; Sun, 22 Nov 2020 14:56:43 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-183-i-qNfYo2OV6UAEX1JHuJTg-1; Sun, 22 Nov 2020 09:56:40 -0500
X-MC-Unique: i-qNfYo2OV6UAEX1JHuJTg-1
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1kgqn5-0000Ms-Pt; Sun, 22 Nov 2020 14:56:36 +0000
Date: Sun, 22 Nov 2020 14:56:35 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Tom Rix <trix@redhat.com>
Message-ID: <20201122145635.GG4327@casper.infradead.org>
References: <20201121165058.1644182-1-trix@redhat.com>
	<20201122032304.GE4327@casper.infradead.org>
	<ddb08a27-3ca1-fb2e-d51f-4b471f1a56a3@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ddb08a27-3ca1-fb2e-d51f-4b471f1a56a3@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net, keyrings@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-scsi@vger.kernel.org,
	clang-built-linux@googlegroups.com,
	amd-gfx@lists.freedesktop.org, cluster-devel@redhat.com,
	linux-acpi@vger.kernel.org, tboot-devel@lists.sourceforge.net,
	coreteam@netfilter.org, xen-devel@lists.xenproject.org,
	MPT-FusionLinux.pdl@broadcom.com, linux-media@vger.kernel.org,
	alsa-devel@alsa-project.org, intel-gfx@lists.freedesktop.org,
	ecryptfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-omap@vger.kernel.org, devel@acpica.org,
	linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
	netfilter-devel@vger.kernel.org, linux-crypto@vger.kernel.org,
	patches@opensource.cirrus.com, joe@perches.com, bpf@vger.kernel.org
Subject: Re: [Cluster-devel] [RFC] MAINTAINERS tag for cleanup robot
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Nov 22, 2020 at 06:46:46AM -0800, Tom Rix wrote:
> 
> On 11/21/20 7:23 PM, Matthew Wilcox wrote:
> > On Sat, Nov 21, 2020 at 08:50:58AM -0800, trix@redhat.com wrote:
> >> The fixer review is
> >> https://reviews.llvm.org/D91789
> >>
> >> A run over allyesconfig for x86_64 finds 62 issues, 5 are false positives.
> >> The false positives are caused by macros passed to other macros and by
> >> some macro expansions that did not have an extra semicolon.
> >>
> >> This cleans up about 1,000 of the current 10,000 -Wextra-semi-stmt
> >> warnings in linux-next.
> > Are any of them not false-positives?  It's all very well to enable
> > stricter warnings, but if they don't fix any bugs, they're just churn.
> >
> While enabling additional warnings may be a side effect of this effort
> 
> the primary goal is to set up a cleaning robot. After that a refactoring robot.

Why do we need such a thing?  Again, it sounds like more churn.
It's really annoying when I'm working on something important that gets
derailed by pointless churn.  Churn also makes it harder to backport
patches to earlier kernels.

