Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 454FC2C25B8
	for <lists+cluster-devel@lfdr.de>; Tue, 24 Nov 2020 13:31:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1606221088;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ETdBmUCF01QVQJOZ+sQu9TUGQeVKu9xOEmE1E5gBvfU=;
	b=hB0aNZTaIxsoGPCFOX5uETEhMzIgBrApW96HQKMGAaT8+pDeZcDsUV53WkZGyw4n7Ur4az
	TQaobzSQs6YQwoqW6hg851GVqTTltUraGNNECoeQuQ/07JDGC3uFZPU+IbZYGAbhXT3bn3
	R7p9uoQD+BASI6g2wqmgFo0cYcc9A4c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-IDn4-3xENPy3eYU_k4Y_eQ-1; Tue, 24 Nov 2020 07:31:26 -0500
X-MC-Unique: IDn4-3xENPy3eYU_k4Y_eQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2A3951FC;
	Tue, 24 Nov 2020 12:31:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 269C060875;
	Tue, 24 Nov 2020 12:31:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DA0875002D;
	Tue, 24 Nov 2020 12:31:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0ANH6Fcq025745 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 23 Nov 2020 12:06:15 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B745B112D403; Mon, 23 Nov 2020 17:06:15 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B362E112D172
	for <cluster-devel@redhat.com>; Mon, 23 Nov 2020 17:06:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9E138811E76
	for <cluster-devel@redhat.com>; Mon, 23 Nov 2020 17:06:11 +0000 (UTC)
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
	[209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-100-5Tb6HpAtM7-KBccO4080Yw-1; Mon, 23 Nov 2020 12:06:09 -0500
X-MC-Unique: 5Tb6HpAtM7-KBccO4080Yw-1
Received: by mail-qt1-f199.google.com with SMTP id g12so14128426qtc.15
	for <cluster-devel@redhat.com>; Mon, 23 Nov 2020 09:06:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=ETdBmUCF01QVQJOZ+sQu9TUGQeVKu9xOEmE1E5gBvfU=;
	b=aeqVnH2AVCx79eqB3deHW8XReFQGgW/5A2PaB3WUPZgM/pFPvIgT12frkPyFGf3QVG
	QDnSdNW/N4AFKwddu8PdC7wM3iaje0kHUbHCGpsOO3SNM5yxUeeUjOejoUPfDa1DeP6u
	Lb9JsZqN/rTKKCMJBHCrsi121s9wb1HGiTjSPRG4ilKEPA/pNKrrZYkyVyhQlTWFZlfF
	v5saWoyS2AUSmASYmPpUmhiqq9chuOwrfl4RjbEwHZY0hqJPdiPqxqkqwaHuiWDznA9l
	1671ClbxdfRrdl4pAAT2eF0CK6EIT5fCI6EhvhRvr+Zlur8D4ms4y4ZDG8PQmg3IDWiG
	E9Vw==
X-Gm-Message-State: AOAM532jEFqmAZt/LqKVgr29np2b5j7PHqdesDrkG5NVJa77SwVhn1QH
	28wqu5YEnG4cD13K/m8uKhDKVxT7Io4RcYeHsGlY47ISGEy8PD/bCCZIi78axm87Au41GkPJIcX
	ctmMQu7GkoX7c/Hd+b3WiJA==
X-Received: by 2002:ac8:5d53:: with SMTP id g19mr70871qtx.354.1606151168818;
	Mon, 23 Nov 2020 09:06:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwHR8oVpP3xv7xpCkK6lH4mawBfXgRI3GL2dEiLGp13/vfLrDKV7SBtsWnvpv2iFDtHltekRw==
X-Received: by 2002:ac8:5d53:: with SMTP id g19mr70839qtx.354.1606151168572;
	Mon, 23 Nov 2020 09:06:08 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
	[75.142.250.213]) by smtp.gmail.com with ESMTPSA id
	o187sm10226153qkb.120.2020.11.23.09.06.04
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 23 Nov 2020 09:06:07 -0800 (PST)
To: Joe Perches <joe@perches.com>, clang-built-linux@googlegroups.com
References: <20201121165058.1644182-1-trix@redhat.com>
	<2105f0c05e9eae8bee8e17dcc5314474b3c0bc73.camel@perches.com>
	<6e8c1926-4209-8f10-d0f9-72c875a85a88@redhat.com>
	<859bae8ddae3238116824192f6ddf1c91a381913.camel@perches.com>
From: Tom Rix <trix@redhat.com>
Message-ID: <88eeba27-ee36-df63-8cd9-3cccbe5e0850@redhat.com>
Date: Mon, 23 Nov 2020 09:06:03 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <859bae8ddae3238116824192f6ddf1c91a381913.camel@perches.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Tue, 24 Nov 2020 07:31:17 -0500
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
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 11/22/20 10:22 AM, Joe Perches wrote:
> On Sun, 2020-11-22 at 08:33 -0800, Tom Rix wrote:
>> On 11/21/20 9:10 AM, Joe Perches wrote:
>>> On Sat, 2020-11-21 at 08:50 -0800, trix@redhat.com wrote:
>>>> A difficult part of automating commits is composing the subsystem
>>>> preamble in the commit log.  For the ongoing effort of a fixer producing
>>>> one or two fixes a release the use of 'treewide:' does not seem appropriate.
>>>>
>>>> It would be better if the normal prefix was used.  Unfortunately normal is
>>>> not consistent across the tree.
>>>>
>>>> So I am looking for comments for adding a new tag to the MAINTAINERS file
>>>>
>>>> 	D: Commit subsystem prefix
>>>>
>>>> ex/ for FPGA DFL DRIVERS
>>>>
>>>> 	D: fpga: dfl:
>>> I'm all for it.  Good luck with the effort.  It's not completely trivial.
>>>
>>> From a decade ago:
>>>
>>> https://lore.kernel.org/lkml/1289919077.28741.50.camel@Joe-Laptop/
>>>
>>> (and that thread started with extra semicolon patches too)
>> Reading the history, how about this.
>>
>> get_maintainer.pl outputs a single prefix, if multiple files have the
>> same prefix it works, if they don't its an error.
>>
>> Another script 'commit_one_file.sh' does the call to get_mainainter.pl
>> to get the prefix and be called by run-clang-tools.py to get the fixer
>> specific message.
> It's not whether the script used is get_maintainer or any other script,
> the question is really if the MAINTAINERS file is the appropriate place
> to store per-subsystem patch specific prefixes.
>
> It is.
>
> Then the question should be how are the forms described and what is the
> inheritance priority.  My preference would be to have a default of
> inherit the parent base and add basename(subsystem dirname).
>
> Commit history seems to have standardized on using colons as the separator
> between the commit prefix and the subject.
>
> A good mechanism to explore how various subsystems have uses prefixes in
> the past might be something like:
>
> $ git log --no-merges --pretty='%s' -<commit_count> <subsystem_path> | \
>   perl -n -e 'print substr($_, 0, rindex($_, ":") + 1) . "\n";' | \
>   sort | uniq -c | sort -rn

Thanks, I have shamelessly stolen this line and limited the commits to the maintainer.

I will post something once the generation of the prefixes is done.

Tom

