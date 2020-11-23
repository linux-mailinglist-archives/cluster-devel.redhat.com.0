Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D158D2C0FBC
	for <lists+cluster-devel@lfdr.de>; Mon, 23 Nov 2020 17:13:18 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-ZMLIBSzfO8y3BDrk5Kg80g-1; Mon, 23 Nov 2020 11:13:15 -0500
X-MC-Unique: ZMLIBSzfO8y3BDrk5Kg80g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02AF5803F4E;
	Mon, 23 Nov 2020 16:13:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D9A560873;
	Mon, 23 Nov 2020 16:13:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6500E180954D;
	Mon, 23 Nov 2020 16:13:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0ANFrjp7015378 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 23 Nov 2020 10:53:45 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1117C2166B2E; Mon, 23 Nov 2020 15:53:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BAB82166B2B
	for <cluster-devel@redhat.com>; Mon, 23 Nov 2020 15:53:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B44E8811E84
	for <cluster-devel@redhat.com>; Mon, 23 Nov 2020 15:53:41 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-556-t-huUwriNpaDBuLwHUDTdQ-1;
	Mon, 23 Nov 2020 10:53:39 -0500
X-MC-Unique: t-huUwriNpaDBuLwHUDTdQ-1
IronPort-SDR: 0sOoN9mjpGsFhGSO69TgIgoMZqPjSPo6RgD9BAdqnf8vVJIaw02FvaoN3IhlEzBkLV1PzmtZem
	qksFie2YHBtg==
X-IronPort-AV: E=McAfee;i="6000,8403,9813"; a="169224211"
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; d="scan'208";a="169224211"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	23 Nov 2020 07:52:35 -0800
IronPort-SDR: o6LRPZSLFHblJ72nLIxI7QtuEJsSPQd11jVZTPC9b01xjBsR6V5ML2IOh4GsWUUm1pKbyVJ0KQ
	V9qBxJqg/0zw==
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; d="scan'208";a="546463497"
Received: from suygunge-mobl.ger.corp.intel.com (HELO localhost)
	([10.249.40.108]) by orsmga005-auth.jf.intel.com with
	ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 07:52:23 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>, trix@redhat.com, 
	joe@perches.com, clang-built-linux@googlegroups.com
In-Reply-To: <5843ef910b0e86c00d9c0143dec20f93823b016b.camel@HansenPartnership.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20201121165058.1644182-1-trix@redhat.com>
	<5843ef910b0e86c00d9c0143dec20f93823b016b.camel@HansenPartnership.com>
Date: Mon, 23 Nov 2020 17:52:20 +0200
Message-ID: <87y2ism5or.fsf@intel.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Mon, 23 Nov 2020 11:13:08 -0500
Cc: linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net, keyrings@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-scsi@vger.kernel.org,
	amd-gfx@lists.freedesktop.org, cluster-devel@redhat.com,
	linux-acpi@vger.kernel.org, tboot-devel@lists.sourceforge.net,
	coreteam@netfilter.org, xen-devel@lists.xenproject.org,
	MPT-FusionLinux.pdl@broadcom.com, linux-media@vger.kernel.org,
	alsa-devel@alsa-project.org, intel-gfx@lists.freedesktop.org,
	ecryptfs@vger.kernel.org, linux-omap@vger.kernel.org,
	devel@acpica.org, linux-nfs@vger.kernel.org,
	netdev@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-bluetooth@vger.kernel.org, netfilter-devel@vger.kernel.org,
	linux-crypto@vger.kernel.org, patches@opensource.cirrus.com,
	linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

On Sat, 21 Nov 2020, James Bottomley <James.Bottomley@HansenPartnership.com> wrote:
> On Sat, 2020-11-21 at 08:50 -0800, trix@redhat.com wrote:
>> A difficult part of automating commits is composing the subsystem
>> preamble in the commit log.  For the ongoing effort of a fixer
>> producing
>> one or two fixes a release the use of 'treewide:' does not seem
>> appropriate.
>> 
>> It would be better if the normal prefix was used.  Unfortunately
>> normal is
>> not consistent across the tree.
>> 
>> 
>> 	D: Commit subsystem prefix
>> 
>> ex/ for FPGA DFL DRIVERS
>> 
>> 	D: fpga: dfl:
>> 
>
> I've got to bet this is going to cause more issues than it solves.

Agreed.

> SCSI uses scsi: <driver>: for drivers but not every driver has a
> MAINTAINERS entry.  We use either scsi: or scsi: core: for mid layer
> things, but we're not consistent.  Block uses blk-<something>: for all
> of it's stuff but almost no <somtehing>s have a MAINTAINERS entry.  So
> the next thing you're going to cause is an explosion of suggested
> MAINTAINERs entries.

On the one hand, adoption of new MAINTAINERS entries has been really
slow. Look at B, C, or P, for instance. On the other hand, if this were
to get adopted, you'll potentially get conflicting prefixes for patches
touching multiple files. Then what?

I'm guessing a script looking at git log could come up with better
suggestions for prefixes via popularity contest than manually maintained
MAINTAINERS entries. It might not always get it right, but then human
outsiders aren't going to always get it right either.

Now you'll only need Someone(tm) to write the script. ;)

Something quick like this:

git log --since={1year} --pretty=format:%s -- <FILES> |\
	grep -v "^\(Merge\|Revert\)" |\
        sed 's/:[^:]*$//' |\
        sort | uniq -c | sort -rn | head -5

already gives me results that really aren't worse than some of the
prefixes invented by drive-by contributors.

> Has anyone actually complained about treewide:?

As Joe said, I'd feel silly applying patches to drivers with that
prefix. If it gets applied by someone else higher up, literally
treewide, then no complaints.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center

