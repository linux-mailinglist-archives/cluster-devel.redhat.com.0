Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5B5153A515D
	for <lists+cluster-devel@lfdr.de>; Sun, 13 Jun 2021 01:21:53 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-b9fFJTp-M5qPKncfGzITUw-1; Sat, 12 Jun 2021 19:21:51 -0400
X-MC-Unique: b9fFJTp-M5qPKncfGzITUw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 60889801B12;
	Sat, 12 Jun 2021 23:21:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A2CFA61093;
	Sat, 12 Jun 2021 23:21:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1725346F81;
	Sat, 12 Jun 2021 23:21:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15CNHrFO017860 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 12 Jun 2021 19:17:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CB15520236FC; Sat, 12 Jun 2021 23:17:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C649220236FA
	for <cluster-devel@redhat.com>; Sat, 12 Jun 2021 23:17:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 005BD8015B9
	for <cluster-devel@redhat.com>; Sat, 12 Jun 2021 23:17:51 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
	[209.85.167.43]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-324-v9aR42_7OteyLcUbzRAwCA-1; Sat, 12 Jun 2021 19:17:48 -0400
X-MC-Unique: v9aR42_7OteyLcUbzRAwCA-1
Received: by mail-lf1-f43.google.com with SMTP id x24so8810227lfr.10
	for <cluster-devel@redhat.com>; Sat, 12 Jun 2021 16:17:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qCXFlg8KkH0YKYOZIBIMSHdr8CfV4JWzrS9dLDGVBxo=;
	b=AJBxSba0DyEXvAbQToGvnBc7qXGgqhGfcsl0liZgz4aQi+Ot0jBoGsMbFJXNZrm8Wv
	ib+5KxhA1OHw7lE5hL4R6ZDZ1/F0SoxZSONlVarLI+W/N7cfV539pLKK2ucNPJsFJGmg
	+KrzQWtER8g9/u6jUo9A3ikfPY9qwBi7llDJrQHT6pbo5LEo2aoJK/e8vOiCSYrsC8Kt
	zNje8qu+KaFjxMhM9D+8rDW8Tglg2j4Iq81S7DVfRUsNhBJhbv/Hm74ZoTrVcdx4rwBv
	v7LlBFYdvoXCLJE8pVcaVkdyBpz7LgCgk4tQ2Jdu+eYAhNffs/O+zJOEPiABbnvHIATS
	QPPA==
X-Gm-Message-State: AOAM531wljvY1QZ+QRVWM1WzxL/5cl3yj5OUJdGONauCj7/aSfhB+VG/
	rKpKt/QyyjPN8gzTF8XLQhfPU3LZaUCD8E50zRs=
X-Google-Smtp-Source: ABdhPJzqymjfCmhOwq3IovyXgCEqdZjw0CZ21bNZbsych1PIc/JmN2zwck1d7ugwlrb9E3a8F7bd/Q==
X-Received: by 2002:a19:4c85:: with SMTP id z127mr7270473lfa.336.1623539866793;
	Sat, 12 Jun 2021 16:17:46 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com.
	[209.85.167.54]) by smtp.gmail.com with ESMTPSA id
	m12sm352887lfg.208.2021.06.12.16.17.46 for <cluster-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sat, 12 Jun 2021 16:17:46 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id x24so8810204lfr.10
	for <cluster-devel@redhat.com>; Sat, 12 Jun 2021 16:17:46 -0700 (PDT)
X-Received: by 2002:a05:6512:3f82:: with SMTP id
	x2mr6860791lfa.421.1623539865998; 
	Sat, 12 Jun 2021 16:17:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210531170123.243771-1-agruenba@redhat.com>
	<20210531170123.243771-6-agruenba@redhat.com>
	<YLUY/7pcFMibDnRn@zeniv-ca.linux.org.uk>
	<YMUjQYtBCIxHvsYV@zeniv-ca.linux.org.uk>
	<CAHk-=whcnziOWqVESWKJ6Y1_sG2S2AOa1vv5yKzUGs5gM7qYpQ@mail.gmail.com>
	<YMUrcUXS5jprfGPF@zeniv-ca.linux.org.uk>
In-Reply-To: <YMUrcUXS5jprfGPF@zeniv-ca.linux.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 12 Jun 2021 16:17:30 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgoBx_GzTQMj_HQGAR+f+7VRJ6JbU9UBfuPHKLfTVMPGQ@mail.gmail.com>
Message-ID: <CAHk-=wgoBx_GzTQMj_HQGAR+f+7VRJ6JbU9UBfuPHKLfTVMPGQ@mail.gmail.com>
To: Al Viro <viro@zeniv.linux.org.uk>
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
Cc: cluster-devel <cluster-devel@redhat.com>, Jan Kara <jack@suse.cz>,
	Matthew Wilcox <willy@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [Cluster-devel] [RFC 5/9] iov_iter: Add
	iov_iter_fault_in_writeable()
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Sat, Jun 12, 2021 at 2:47 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
>         O_DIRECT case is a PITA - there we use GUP and there's no way
> to tell GUP that in the current situation we do *NOT* want to hit
> ->fault()/->page_mkwrite()/etc.  pagefault_disable() won't be even
> noticed there...

Well, we could change that.

And we do have get_user_pages_fast_only() these days.

              Linus

