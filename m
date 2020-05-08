Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 75D911CD4CD
	for <lists+cluster-devel@lfdr.de>; Mon, 11 May 2020 11:23:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589189015;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=tYjR6s9cuyjlDmq4sL9p5CobFaXnRJm49suPQ+5q4HE=;
	b=VF1Ji/jfQRQpo4YN+g6T3blJfJzXnq20Z2Y1L3djbAMmuv5oH0tIUf8x9thbFTnz4VRjoL
	ya3FuNhswhEdbJeWkBhsjb6zJIPkMZN3pQifqz5SJCe4KpVu26fQVB0D2L0KI8NO7OkVY9
	a94yNAHV7rCU8R7NDg02gOyOu23o0bo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-A1i0JwSVMDi1i50wrtruyQ-1; Mon, 11 May 2020 05:23:32 -0400
X-MC-Unique: A1i0JwSVMDi1i50wrtruyQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AECFD107ACF3;
	Mon, 11 May 2020 09:23:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 886E11001DC2;
	Mon, 11 May 2020 09:23:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BE9B34E561;
	Mon, 11 May 2020 09:23:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 048IBJHK006310 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 8 May 2020 14:11:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 758681054EB0; Fri,  8 May 2020 18:11:19 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 70EE71054EAF
	for <cluster-devel@redhat.com>; Fri,  8 May 2020 18:11:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 60EEE1859171
	for <cluster-devel@redhat.com>; Fri,  8 May 2020 18:11:17 +0000 (UTC)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-78-IMt14Nt1O3KJKp6otjj_nA-1; Fri, 08 May 2020 14:11:15 -0400
X-MC-Unique: IMt14Nt1O3KJKp6otjj_nA-1
Received: by mail-pl1-f196.google.com with SMTP id b8so1073130plm.11
	for <cluster-devel@redhat.com>; Fri, 08 May 2020 11:11:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tYjR6s9cuyjlDmq4sL9p5CobFaXnRJm49suPQ+5q4HE=;
	b=taeJXUyzZPFew+2h48Nksz4PcdC8MUV+yHfRRyFbFL1g5BFMrVju+hwaHNzdqM1oIu
	xemnBNsG6qL4vyEE/9s/J79Oz2TFgwXg6CkR2G5p+LCuLrcik1GmkoL8+0r6Gjf5mizy
	Clv9XULbJcyCKgKbHdGc48oNe5N8IPYLanw3ezgfskFORpO3lEcWtcnganbN8NWCPtaD
	aOwjzzqNc6l3esLXgSjALmbU+afgTy7Pdm0s8G3TkDQycGB2+Wmk8EuZqZvOGViGJD9e
	LV+jDRFOhvYnXRY7UFWrlxne8N4L21Z7MYBhHJz4lr1RYHlLKLAYfcGMIEpY0bvtZUBh
	fUng==
X-Gm-Message-State: AGi0PuYw4YtdD/IGqHTfYLTAXoP/tPKPobZsF1myapGzRI09mc/N3NIA
	cWFzDLaVqt9BsSDvC5EOQ66cdq/y/3jx+1T4V4jqww==
X-Google-Smtp-Source: APiQypIYIM9VOOYp5ro1MKdACCeZ5QjjejURIoETZk6jbD9w5jomYTkwA+Xnyz4419TolW8xbVLBKxeTlX2tGLG3yO8=
X-Received: by 2002:a17:90a:6d03:: with SMTP id
	z3mr7458232pjj.32.1588961473692; 
	Fri, 08 May 2020 11:11:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200507213438.1886005-1-arnd@arndb.de>
In-Reply-To: <20200507213438.1886005-1-arnd@arndb.de>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 8 May 2020 11:11:02 -0700
Message-ID: <CAKwvOdmk0bKNY735KNtB1agDgTwcLNM=DEU7pL3wwZTj7hQh2Q@mail.gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Mon, 11 May 2020 05:23:21 -0400
Cc: Alexios Zavras <alexios.zavras@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	LKML <linux-kernel@vger.kernel.org>, cluster-devel@redhat.com,
	clang-built-linux <clang-built-linux@googlegroups.com>,
	Josh Poimboeuf <jpoimboe@redhat.com>, Richard Fontana <rfontana@redhat.com>
Subject: Re: [Cluster-devel] [PATCH] dlm: remove BUG() before panic()
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Thu, May 7, 2020 at 2:34 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> Building a kernel with clang sometimes fails with an objtool error in dlm:
>
> fs/dlm/lock.o: warning: objtool: revert_lock_pc()+0xbd: can't find jump dest instruction at .text+0xd7fc
>
> The problem is that BUG() never returns and the compiler knows
> that anything after it is unreachable, however the panic still
> emits some code that does not get fully eliminated.
>
> Having both BUG() and panic() is really pointless as the BUG()
> kills the current process and the subsequent panic() never hits.
> In most cases, we probably don't really want either and should
> replace the DLM_ASSERT() statements with WARN_ON(), as has
> been done for some of them.
>
> Remove the BUG() here so the user at least sees the panic message
> and we can reliably build randconfig kernels.
>
> Fixes: e7fd41792fc0 ("[DLM] The core of the DLM for GFS2/CLVM")
> Cc: Josh Poimboeuf <jpoimboe@redhat.com>
> Cc: clang-built-linux@googlegroups.com
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks for the patch.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  fs/dlm/dlm_internal.h | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
> index 416d9de35679..4311d01b02a8 100644
> --- a/fs/dlm/dlm_internal.h
> +++ b/fs/dlm/dlm_internal.h
> @@ -97,7 +97,6 @@ do { \
>                 __LINE__, __FILE__, #x, jiffies); \
>      {do} \
>      printk("\n"); \
> -    BUG(); \
>      panic("DLM:  Record message above and reboot.\n"); \
>    } \
>  }
> --
> 2.26.0


-- 
Thanks,
~Nick Desaulniers

