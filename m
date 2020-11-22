Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 65E042BC73A
	for <lists+cluster-devel@lfdr.de>; Sun, 22 Nov 2020 17:50:06 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-AiMGXVUdOjqs_9meXc1rSg-1; Sun, 22 Nov 2020 11:50:03 -0500
X-MC-Unique: AiMGXVUdOjqs_9meXc1rSg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF5BB1868404;
	Sun, 22 Nov 2020 16:50:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1319F5D6CF;
	Sun, 22 Nov 2020 16:50:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1F4034A7C6;
	Sun, 22 Nov 2020 16:49:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AMGnso6019815 for <cluster-devel@listman.util.phx.redhat.com>;
	Sun, 22 Nov 2020 11:49:54 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6F71147CDC; Sun, 22 Nov 2020 16:49:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A1D247CE6
	for <cluster-devel@redhat.com>; Sun, 22 Nov 2020 16:49:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4CE4C185A794
	for <cluster-devel@redhat.com>; Sun, 22 Nov 2020 16:49:52 +0000 (UTC)
Received: from bedivere.hansenpartnership.com
	(bedivere.hansenpartnership.com [96.44.175.130]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-110-zbQ3JDruNPKZ3Jv8NEMZVA-1;
	Sun, 22 Nov 2020 11:49:50 -0500
X-MC-Unique: zbQ3JDruNPKZ3Jv8NEMZVA-1
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id AB0CF1280302; 
	Sun, 22 Nov 2020 08:49:44 -0800 (PST)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id iwIwMm9lBMHQ; Sun, 22 Nov 2020 08:49:44 -0800 (PST)
Received: from jarvis.int.hansenpartnership.com (unknown
	[IPv6:2601:600:8280:66d1::527])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id
	CCD1012802EA; Sun, 22 Nov 2020 08:49:42 -0800 (PST)
Message-ID: <751803306cd957d0e7ef6a4fc3dbf12ebceaba92.camel@HansenPartnership.com>
From: James Bottomley <James.Bottomley@hansenpartnership.com>
To: Tom Rix <trix@redhat.com>, Matthew Wilcox <willy@infradead.org>
Date: Sun, 22 Nov 2020 08:49:41 -0800
In-Reply-To: <0819ce06-c462-d4df-d3d9-14931dc5aefc@redhat.com>
References: <20201121165058.1644182-1-trix@redhat.com>
	<20201122032304.GE4327@casper.infradead.org>
	<ddb08a27-3ca1-fb2e-d51f-4b471f1a56a3@redhat.com>
	<20201122145635.GG4327@casper.infradead.org>
	<0819ce06-c462-d4df-d3d9-14931dc5aefc@redhat.com>
User-Agent: Evolution 3.34.4
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-11-22 at 08:10 -0800, Tom Rix wrote:
> On 11/22/20 6:56 AM, Matthew Wilcox wrote:
> > On Sun, Nov 22, 2020 at 06:46:46AM -0800, Tom Rix wrote:
> > > On 11/21/20 7:23 PM, Matthew Wilcox wrote:
> > > > On Sat, Nov 21, 2020 at 08:50:58AM -0800, trix@redhat.com
> > > > wrote:
> > > > > The fixer review is
> > > > > https://reviews.llvm.org/D91789
> > > > > 
> > > > > A run over allyesconfig for x86_64 finds 62 issues, 5 are
> > > > > false positives. The false positives are caused by macros
> > > > > passed to other macros and by some macro expansions that did
> > > > > not have an extra semicolon.
> > > > > 
> > > > > This cleans up about 1,000 of the current 10,000 -Wextra-
> > > > > semi-stmt warnings in linux-next.
> > > > Are any of them not false-positives?  It's all very well to
> > > > enable stricter warnings, but if they don't fix any bugs,
> > > > they're just churn.
> > > > 
> > > While enabling additional warnings may be a side effect of this
> > > effort
> > > 
> > > the primary goal is to set up a cleaning robot. After that a
> > > refactoring robot.
> > Why do we need such a thing?  Again, it sounds like more churn.
> > It's really annoying when I'm working on something important that
> > gets derailed by pointless churn.  Churn also makes it harder to
> > backport patches to earlier kernels.
> > 
> A refactoring example on moving to treewide, consistent use of a new
> api may help.
> 
> Consider
> 
> 2efc459d06f1630001e3984854848a5647086232
> 
> sysfs: Add sysfs_emit and sysfs_emit_at to format sysfs output
> 
> A new api for printing in the sysfs.  How do we use it treewide ?
> 
> Done manually, it would be a heroic effort requiring high level
> maintainers pushing and likely only get partially done.
> 
> If a refactoring programatic fixit is done and validated on a one
> subsystem, it can run on all the subsystems.
> 
> The effort is a couple of weeks to write and validate the fixer,
> hours to run over the tree.
> 
> It won't be perfect but will be better than doing it manually.

Here's a thought: perhaps we don't.  sysfs_emit isn't a "new api" its a
minor rewrap of existing best practice.  The damage caused by the churn
of forcing its use everywhere would far outweigh any actual benefit
because pretty much every bug in this area has already been caught and
killed by existing tools.  We can enforce sysfs_emit going forwards
using tools like checkpatch but there's no benefit and a lot of harm to
be done by trying to churn the entire tree retrofitting it (both in
terms of review time wasted as well as patch series derailed).

James


