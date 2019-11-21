Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 168B41050D9
	for <lists+cluster-devel@lfdr.de>; Thu, 21 Nov 2019 11:46:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574333207;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=86bdYUcQUBBSLGBBYwLq+ck0Nr2pmnPxU5A1f6BfzaI=;
	b=XVX+gvxDrOo44uzrO0iI9WhydJFsJRfpIbIfmvJwRHV/3bhANbKo0SjvCyJRCPJWR9oTZ+
	rSzT4pDlIJKMpkFv7OqMwdYdOvg6IIdTsBrIoa6FytlRPqPG23WtoEGu4pjh1+fVFq69EY
	CPPDcXtT4jWWVjRqIE6D6kgXq6Lx+iU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-qYgQimCiPZaO93rLVY32kg-1; Thu, 21 Nov 2019 05:46:45 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 361B78C3D80;
	Thu, 21 Nov 2019 10:46:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CFB569500;
	Thu, 21 Nov 2019 10:46:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6C6554BB5C;
	Thu, 21 Nov 2019 10:46:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xALAkWUL004674 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 21 Nov 2019 05:46:32 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 07EFA2157F39; Thu, 21 Nov 2019 10:46:32 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 03EEC2166B2B
	for <cluster-devel@redhat.com>; Thu, 21 Nov 2019 10:46:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3020E185A791
	for <cluster-devel@redhat.com>; Thu, 21 Nov 2019 10:46:30 +0000 (UTC)
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
	[209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-287-IDd2bW6SP72Bm64ma9_J6g-1; Thu, 21 Nov 2019 05:46:28 -0500
Received: by mail-ot1-f69.google.com with SMTP id i13so1444391otc.0
	for <cluster-devel@redhat.com>; Thu, 21 Nov 2019 02:46:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=86bdYUcQUBBSLGBBYwLq+ck0Nr2pmnPxU5A1f6BfzaI=;
	b=Qp+OxaQNjJqoGKQpkJDJPXprofMR7x2dU/oGqfyRA+bc4kg5zPS2AnCU8Cvjhmgj7G
	/xhvfSfBb0tfVyEjdb7vj7vScczQsvzrdBuJz7dDEBjjCFId+3PhPp6ApU9SzPob5Gog
	xUGN699cHBmXWAae6o+43XgmmG5B5EziELTYn8F52LlIpI0xtBT6lAJEl6vqj4Sy10IE
	uZlFpCsTBolE4NMDDXi3mZtlPh4pd2BtycIokn7sf+BRnaTLSaruSoByXUTIeroRUaLq
	0YgNIR+2pboQkPCoYz5qLjA473YyBqSaPSAQ954EJ/hsO+DukyZ8zlWR8VklUTK2/TPZ
	mjxQ==
X-Gm-Message-State: APjAAAWMcMD4Yg29gU09Ll3SHEI6jPgLP4643LATvBDOKITYXfncWTBm
	tBzI/AD5PRRZ/zlCl9O8Slkt/jvPQRjz2eNp7GCk2hNlbLS2rYvjTatRk3LNdXQvimCAZicPA3I
	S3chVWx2Sp/WmTZGnNfxFdTDIWS6WrhjhfIMPSw==
X-Received: by 2002:a9d:191e:: with SMTP id j30mr5930990ota.297.1574333188077; 
	Thu, 21 Nov 2019 02:46:28 -0800 (PST)
X-Google-Smtp-Source: APXvYqxv+BnVc5uTsXP2b/uChXTw/WXuirw/77RhthnZwX9f/UpssU6kpK4rLMCcWt0hSiINmG9SIBPVTRmG9j/mzG0=
X-Received: by 2002:a9d:191e:: with SMTP id j30mr5930980ota.297.1574333187883; 
	Thu, 21 Nov 2019 02:46:27 -0800 (PST)
MIME-Version: 1.0
References: <501115369.35690105.1574257982295.JavaMail.zimbra@redhat.com>
	<107211449.35690135.1574257994946.JavaMail.zimbra@redhat.com>
In-Reply-To: <107211449.35690135.1574257994946.JavaMail.zimbra@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 21 Nov 2019 11:46:16 +0100
Message-ID: <CAHc6FU7TXX1eMv_b2HSYam+EbeX5yDmZDXzU=eTe51pPRLJ0Ng@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-MC-Unique: IDd2bW6SP72Bm64ma9_J6g-1
X-MC-Unique: qYgQimCiPZaO93rLVY32kg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xALAkWUL004674
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH] gfs2: Don't write log headers
 after file system withdraw
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Bob,

On Wed, Nov 20, 2019 at 2:53 PM Bob Peterson <rpeterso@redhat.com> wrote:
> Before this patch, when a node withdrew a gfs2 file system, it
> wrote a (clean) unmount log header. That's wrong. You don't want
> to write anything to the journal once you're withdrawn because
> that's acknowledging that the transaction is complete and the
> journal is in good shape, neither of which may be a valid
> assumption when the file system is withdrawn. This is especially
> true if the withdraw was caused due to io errors writing to the
> journal in the first place. The best course of action is to leave
> the journal "as is" until it may be safely replayed during
> journal recovery, regardless of whether it's done by this node or
> another.
>
> Signed-off-by: Bob Peterson <rpeterso@redhat.com>

ok, pushed.

Thanks,
Andreas


