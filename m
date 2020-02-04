Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 538EA152221
	for <lists+cluster-devel@lfdr.de>; Tue,  4 Feb 2020 22:55:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580853351;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=MMHWvlnhCpd3d9uCCkNdBCYL+bznJYMu+GdSlrQk8kw=;
	b=Mm/B71wSwfdAsqgBtRCAd2KnjDimMjSSK2Vloypgnnjc24dEg3K1sthTZVCHY6gMV8bTuM
	Fdt2OsN6451i5amBEOASLPxynCGw6FrEpd0CTEPboGCdH/DlngQUYqKKuBnHeOts/0HfOI
	QGdMGEk4BuqBQm7YCmzAKjWwC9AVHsw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-ls7hJK8hM4afyot-ggceaw-1; Tue, 04 Feb 2020 16:55:49 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 805CC18B5F77;
	Tue,  4 Feb 2020 21:55:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BC56781213;
	Tue,  4 Feb 2020 21:55:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1D227180880C;
	Tue,  4 Feb 2020 21:55:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 014LtdHo013147 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 4 Feb 2020 16:55:40 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D80062166B2A; Tue,  4 Feb 2020 21:55:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D3FE62166B28
	for <cluster-devel@redhat.com>; Tue,  4 Feb 2020 21:55:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 630118015A3
	for <cluster-devel@redhat.com>; Tue,  4 Feb 2020 21:55:37 +0000 (UTC)
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
	[209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-296-Cwp7Jnr3MDW0gpxAej_5ng-1; Tue, 04 Feb 2020 16:55:35 -0500
Received: by mail-oi1-f198.google.com with SMTP id k206so8376135oia.22
	for <cluster-devel@redhat.com>; Tue, 04 Feb 2020 13:55:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=MMHWvlnhCpd3d9uCCkNdBCYL+bznJYMu+GdSlrQk8kw=;
	b=cZTD5K8VNS/68JWaooKKSOadORuqAqpFmSx6vK3fyiUldevtPblO3r2CmQK67ZG4Y9
	BnywYSYxkaBRQeV69MgTO4PgKOm2ZikHODzwewHEPE/fhg8q0RgtdVzKphznKn2uQeHy
	7CdhTagpJxNDKKiL15JDN0BOCrz6k6efgAF+OOKDQHb0KL/0ZKR5fq16dwDZxKH48Lgp
	obFK9dV7akpPW55bbvjxWNMS25GBWjZX+L0Crv5iT75TEkyG1vBhkZS6SePjPubyzQ8n
	RCRk3Vz8R0npqYQWZ7Ab14PJi5vSY8fJRXGUmMSeUZVXi8uAtzaLMMwf6Kw6xump0has
	Z95w==
X-Gm-Message-State: APjAAAUpIOVjPOF+EZdxLNeElKNak7ELdhxeg9gFtIQM4YxIjL2NYRAe
	er6fvPyy0NOZsyBeV0y0Tdz6ndV7m39Mg3VjdS/rlTPwLv4Rtj3PFaJDokIaTjtsgWEzs7ltVYU
	KpTk8s2xEgH+4h7hdf2dy19TFbFYBi03K12e3QA==
X-Received: by 2002:aca:5094:: with SMTP id e142mr732311oib.101.1580853330627; 
	Tue, 04 Feb 2020 13:55:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqxx/N5v7//5gVwwzqrY2YDJs05cY27KEHR+5YN7d7Mm6y9Op9gLdisSB2lEVAeAJRVRCUSCkTVz2BIDaINsPEE=
X-Received: by 2002:aca:5094:: with SMTP id e142mr732302oib.101.1580853330381; 
	Tue, 04 Feb 2020 13:55:30 -0800 (PST)
MIME-Version: 1.0
References: <20200204201456.7764-1-adas@redhat.com>
In-Reply-To: <20200204201456.7764-1-adas@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 4 Feb 2020 22:55:19 +0100
Message-ID: <CAHc6FU6MCcxCaHe6zVfQdOkoc9whAuJtrYMH+X_EbR+HLb+K0g@mail.gmail.com>
To: Abhi Das <adas@redhat.com>
X-MC-Unique: Cwp7Jnr3MDW0gpxAej_5ng-1
X-MC-Unique: ls7hJK8hM4afyot-ggceaw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 014LtdHo013147
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH v2] gfs2: fix gfs2_find_jhead that
 returns uninitialized jhead with seq 0
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Abhi,

On Tue, Feb 4, 2020 at 9:15 PM Abhi Das <adas@redhat.com> wrote:
> When the first log header in a journal happens to have a sequence
> number of 0, a bug in gfs2_find_jhead() causes it to prematurely exit,
> and return an uninitialized jhead with seq 0. This can cause failures
> in the caller. For instance, a mount fails in one test case.
>
> The correct behavior is for it to continue searching through the journal
> to find the correct journal head with the highest sequence number.

applied for the next merge window, with a suitable Fixes tag for stable.

Thanks,
Andreas


